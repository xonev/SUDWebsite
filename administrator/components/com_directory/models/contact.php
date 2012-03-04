<?php
/**
 * Contains the model for adding/editing a contact.
 * @version $Id: contact.php 217 2009-03-25 12:03:53Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The model for adding/editing a contact
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelContact extends JModel
{
	
	/**
	 * Retrieves all of the departments (or categories).
	 * @access public
	 * @return array an array of objects
	 */
	function getDepartments()
	{
		$db = JFactory::getDBO();
		$query = 'SELECT id, title AS name FROM #__directory_categories WHERE section="com_directory" ORDER BY name ASC';
		$db->setQuery( $query );
		$selectPrompter = new stdClass();
		$selectPrompter->id = 0;
		$selectPrompter->name = JText::_( '---Select a Department---' );
		$departments = $db->loadObjectList();
		array_unshift( $departments, $selectPrompter );
		return $departments;
	}

	/**
	 * Gets the positions for the current contact from the database and returns them.
	 * @param dbObject &$db a reference to the database
	 * @param int $id the id of the contact to get the positions for
	 * @return array of objects $result the list of positions
	 */
	function getPositions( &$db, $id )
	{
		$query = $this->_getPositionsQuery( $id );
		$db->setQuery( $query );
		$result = $db->loadObjectList();
		// add a blank position to the list of positions
		$theNewPosition = new stdClass();
		$theNewPosition->position = '';
		$theNewPosition->id = 0;
		$theNewPosition->ordering = null;
		$result[] = $theNewPosition;
		return $result;
	}

	/**
	 * Constructs a query for getting positions from the database.
	 * @access protected
	 * @param int $id the id of the contact to get positions for
	 * @return string $query the query string
	 */
	function _getPositionsQuery( $id )
	{
		$select = 'positionsTable.id, positionsTable.position, positionsTable.ordering, departmentTable.title AS department, departmentTable.id AS departmentId';
		$from = '#__directory_contact_positions AS positionsTable';
		$joins[] = 'INNER JOIN #__directory_categories AS departmentTable ON positionsTable.department_id = departmentTable.id';
		$wheres[] = 'positionsTable.contact_id = ' . $id;

		$query = 'SELECT ' . $select .
			' FROM ' . $from .
			' ' . implode( ', ', $joins ) .
			' WHERE ' . implode( ' AND ', $wheres);

		return $query;
	}

	/**
	 * Saves a contact to the database.
	 * @access public
	 * @param bool $saveCopy whether or not a copy should be created
	 * @return int the id of the contact
	 */
	function saveContact( $saveCopy = false )
	{
		// Initialize variables
		$db		=& JFactory::getDBO();
		$row	=& $this->getTable();
		$post = JRequest::get( 'post' );
		$post['misc'] = JRequest::getVar('misc', '', 'POST', 'string', JREQUEST_ALLOWHTML);
		if (!$row->bind( $post )) {
			JError::raiseError(500, $row->getError() );
		}

		$row->name = $row->first_name . ' ' . $row->last_name;

		// save params
		$params = JRequest::getVar( 'params', array(), 'post', 'array' );
		if (is_array( $params )) {
			$txt = array();
			foreach ( $params as $k=>$v) {
				$txt[] = "$k=$v";
			}
			$row->params = implode( "\n", $txt );
		}

		// save to a copy, reset the primary key
		if ($saveCopy) {
			$row->id = 0;
		}

		// pre-save checks
		if (!$row->check()) {
			JError::raiseError(500, $row->getError() );
		}

		// if new item, order last in appropriate group
		if (!$row->id) {
			$where = "catid = " . (int) $row->catid;
			$row->ordering = $row->getNextOrder( $where );
		}

		// save the changes
		if (!$row->store()) {
			JError::raiseError(500, $row->getError() );
		}
		$row->checkin();
		if ($row->default_con) {
			$query = 'UPDATE #__directory_contacts'
			. ' SET default_con = 0'
			. ' WHERE id <> '. (int) $row->id
			. ' AND default_con = 1'
			;
			$db->setQuery( $query );
			$db->query();
		}

		// if a position was marked for deletion delete it
		$idToDelete = $post[ 'positionToDelete' ];
		if ( !empty( $idToDelete ) ) {
			$this->_deletePosition( $idToDelete );
		}

		// save any new positions
		$this->_savePositions( $post, $row->id );

		return $row->id;
	}

	/**
	 * Removes contacts from the database.
	 * @access public
	 * @return mixed an error message if the query fails, true otherwise
	 */
	function removeContacts( &$cid )
	{
		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );

		// Initialize variables
		$db =& JFactory::getDBO();
		JArrayHelper::toInteger($cid);

		if (count( $cid )) {
			$cids = implode( ',', $cid );
			$query = 'DELETE FROM #__directory_contacts'
			. ' WHERE id IN ( '. $cids .' )'
			;
			$db->setQuery( $query );
			$result = $db->query();
			if (!$result) {
				echo "<script> alert('".$db->getErrorMsg(true)."'); window.history.go(-1); </script>\n";
			}
		}
	}

	/**
	 * Deletes a position specified by the id of the position in the table.
	 * @access protected
	 * @param int $id the id of the position to delete
	 */
	function _deletePosition( $id ) {
		$db =& JFactory::getDBO();

		$query = 'DELETE FROM #__directory_contact_positions WHERE id=' . (int)$id;
		$db->setQuery( $query );
		if ( !$db->query() ) {
			echo "<script> alert('".$db->getErrorMsg(true)."'); </script>\n";
		}
	}

	/**
	 * Stores the contact positions in the database.
	 * @access protected
	 * @param mixed array $post an associative array of data which was posted
	 * @param int $id the id of the current contact
	 */
	function _savePositions( $post, $id = null ) {
		//get the array of positions to be saved in the database
		$positions = $this->_getUpdatePositions( $post, $id );
		//if there are positions to be saved
		if( !empty( $positions ) ) {
			//save each of the positions in the database
			foreach ( $positions as $position ) {
				$row =& $this->getTable( 'positions', 'Table' );
				if ( !$row->bind( $position ) ) {
					JError::raiseError( 500, $row->getError() );
				}
				if ( !$row->check() ) {
					JError::raiseError( 500, $row->getError() );
				}
				if ( !$row->store() ) {
					JError::raiseError( 500, $row->getError() );
				}
			}
		}
	}

	/**
	 * Returns an array of associative arrays with the contact positions information.
	 * @access protected
	 * @param mixed array $post an array of data which was POSTed
	 * @param int $contact_id the id of the current contact
	 * @return array a list of positions' information that was POSTed
	 */
	function _getUpdatePositions( $post, $contact_id = null ) {
		$id = $post[ 'positionid0' ];
		$results = array();
		
		//if the contact is a new contact and does not have any stored positions
		if ( empty( $id ) ) {
			//add the single position to the list
			$results[ 0 ][ 'id' ] = $id;
			$results[ 0 ][ 'position' ] = $post[ 'con_position0' ];
			$results[ 0 ][ 'department_id' ] = $post[ 'catid0' ];
			$results[ 0 ][ 'contact_id' ] = $contact_id;
			$results[ 0 ][ 'ordering' ] = $post[ 'con_position_order0' ];
		}
		//otherwise get all of the positions that were POSTed
		else {
			$stopLoop = false;
			$contactId = $post[ 'id' ];
			$index = 0;
			do {
				$id = $post[ 'positionid' . $index ];
				$position = $post[ 'con_position' . $index];
				$departmentId = $post[ 'catid' . $index ];
				$order = $post[ 'con_position_order' . $index ];

				if ( empty( $id ) ) {
					$stopLoop = true;
				}

				//if no input was left blank
				if ( self::allNotEmpty( array( $position, $departmentId, $contactId ) ) ) {
					//add information for the position to the list
					$results[ $index ][ 'id' ] = $id;
					$results[ $index ][ 'position' ] = $position;
					$results[ $index ][ 'department_id' ] = $departmentId;
					$results[ $index ][ 'contact_id' ] = $contactId;
					$results[ $index ][ 'ordering' ] = $order;
				}
				++$index;
			} while ( !$stopLoop );
		}

		//return the list of positions information
		return $results;
	}

	/**
	 * Checks the elements of the array passed in to see if they're empty
	 * @access public
	 * @param mixed array $array the array of variables to be checked
	 * @return boolean true if none of the elements are empty, false otherwise
	 */
	function allNotEmpty( $array ) {
		foreach ( $array as $variable ) {
			if ( empty( $variable ) ) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Change contact publishing status
	 * @access public
	 * @param array $cid an array of unique ids for contacts that need to be changed.
	 * @param int $state 1 if the contacts are to be published, 0 for unpublished
	 */
	function changeContact( &$cid, $state )
	{
		// Initialize variables
		$db 	=& JFactory::getDBO();
		$user 	=& JFactory::getUser();
		JArrayHelper::toInteger($cid);

		if (count( $cid ) < 1) {
			$action = $state ? 'publish' : 'unpublish';
			JError::raiseError(500, JText::_( 'Select an item to' .$action, true ) );
		}

		$cids = implode( ',', $cid );

		$query = 'UPDATE #__directory_contacts'
		. ' SET published = ' . (int) $state
		. ' WHERE id IN ( '. $cids .' )'
		. ' AND ( checked_out = 0 OR ( checked_out = '. (int) $user->get('id') .' ) )'
		;
		$db->setQuery( $query );
		if (!$db->query()) {
			JError::raiseError(500, $db->getErrorMsg() );
		}

		if (count( $cid ) == 1) {
			$row =& JTable::getInstance('contact', 'Table');
			$row->checkin( intval( $cid[0] ) );
		}
	}

	/**
	 * Changes the access level of a contact.
	 * @access public
	 * @param int $id the ID of the contact
	 * @param int $access the access level to change to
	 */
	function changeContactAccess( $id, $access )
	{
		$row =& JTable::getInstance('contact', 'Table');
		$row->load( $id );
		$row->access = $access;

		if ( !$row->check() ) {
			return $row->getError();
		}
		if ( !$row->store() ) {
			return $row->getError();
		}
	}

	/**
	 * Checks in a contact (gets contact info from the request).
	 * @access public
	 */
	function checkInContact()
	{
		$row =& $this->getTable();
		$row->bind( JRequest::get( 'post' ));
		$row->checkin();
	}
}
