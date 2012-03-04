<?php
/**
 * Contains the model for showing a list of contacts.
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

class DirectoryAdminModelContacts extends JModel
{
	var $_filterOrder = null;
	var $_filterOrderDir = null;
	var $_filterState = null;
	var $_filterCatId = null;
	var $_filterSectionId = null;
	var $_search = null;
	var $_limit = null;
	var $_limitstart = null;
	var $_retrievedUserState = null;
	var $_total = null;
	var $_query = null;

	/**
	 * Retrieves contacts from the database, based on the user state.
	 * @access public
	 * @return array a list of contact objects
	 */
	function getContacts()
	{
		$query = $this->_getContactsQuery();
		$this->_total = $this->_getListCount( $query );
		return $this->_getList( $query, $this->_limitstart, $this->_limit );
	}

	/**
	 * Retrieves the pagination object for the list of contacts.
	 * @access public
	 * @return JPagination
	 */
	function getPagination()
	{
		if ( !$this->_pagination ) {
			$this->_setUserState();
			if ( !$this->_total ) {
				$this->_total = $this->_getListCount( $this->_getContactsQuery() );
			}
			jimport( 'joomla.html.pagination' );
			$this->_pagination = new JPagination( $this->_total, $this->_limitstart, $this->_limit );
		}
		return $this->_pagination;
	}

	/**
	 * Retrieves the current filter category id.
	 * @access public
	 * @return int
	 */
	function getFilterCatId()
	{
		$this->_setUserState();
		return $this->_filterCatId;
	}

	/**
	 * Retrieves the currend id of the selected state.
	 * @access public
	 * @return int
	 */
	function getFilterState()
	{
		$this->_setUserState();
		return $this->_filterState;
	}

	/**
	 * Retrieves the current ordering direction.
	 * @access public
	 * @return string
	 */
	function getFilterOrderDir()
	{
		$this->_setUserState();
		return $this->_filterOrderDir;
	}

	/**
	 * Retrieves the current column to order by.
	 * @access public
	 * @return string
	 */
	function getFilterOrder()
	{
		$this->_setUserState();
		return $this->_filterOrder;
	}

	/**
	 * Retrieves the current search term.
	 * @access public
	 * @return string
	 */
	function getSearch()
	{
		$this->_setUserState();
		return $this->_search;
	}

	/**
	 * Retrieves the section id filter value.
	 * @access public
	 * @return int
	 */
	function getFilterSectionId()
	{
		$this->_setUserState();
		return $this->_filterSectionId;
	}

	/**
	 * Retrieves the users current contact information viewing state.
	 * Puts the state into the models member variables.
	 * @access protected
	 */
	function _setUserState()
	{
		if ( !$this->_retrievedUserState ) {
			global $mainframe;
			$this->_filterOrder		= $mainframe->getUserStateFromRequest( $option.'filter_order', 'filter_order', 'cd.ordering', 'cmd' );
			$this->_filterOrderDir	= $mainframe->getUserStateFromRequest( $option.'filter_order_Dir', 'filter_order_Dir', '', 'word' );
			$this->_filterState 		= $mainframe->getUserStateFromRequest( $option.'filter_state', 'filter_state', '', 'word' );
			$this->_filterCatId 		= $mainframe->getUserStateFromRequest( $option.'filter_catid', 'filter_catid', 0, 'int' );
			$this->_filterSectionId = $mainframe->getUserStateFromRequest( $option.'filter_sectionid', 'filter_sectionid', 0, 'int' );
			$this->_search 			= $mainframe->getUserStateFromRequest( $option.'search', 'search', '', 'string' );
			$this->_search 			= JString::strtolower( $this->_search );

			$this->_limit		= $mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int');
			$this->_limitstart	= $mainframe->getUserStateFromRequest($option.'.limitstart', 'limitstart', 0, 'int');
			$this->_retrievedUserState = true;
		}
	}

	/**
	 * Returns whether or not to show the category and ordering.
	 * @access public
	 * @return bool
	 */
	function getShowCategoryOrdering()
	{
		$this->_setUserState();
		return ($this->_filterCatId ? true : false);
	}
	
	/**
	 * Retrieves a position id for a certain contact id (the category id is retrieved from request).
	 * @access public
	 * @param mixed either a single id or an array of IDs
	 * @return mixed
	 */
	function getPositionIds( $contactId )
	{
		if ( is_array($contactId) ) {
			$where = 'contact.id IN (' . implode( ', ', $contactId ) . ')';
		}
		else {
			$where = 'contact.id = '.(int) $contactId;
		}
		$this->_setUserState();
		$department = $this->_filterCatId;
		$query = 'SELECT position.id AS id, contact.id AS contact_id'
			. ' FROM #__directory_contact_positions AS position'
			. ' INNER JOIN #__directory_contacts AS contact ON position.contact_id = contact.id'
			. ' WHERE ' . $where . ' AND position.department_id = '.$department
		;
		$positions = $this->_getList( $query );
		if ( is_array($contactId) ) {
			$ids = array();
			foreach ($positions as $position) {
				$ids[$position->contact_id] = $position->id;
			}
			return $ids;
		}
		else {
			return $positions[0]->id;
		}
	}

	/**
	 * Changes the contact's order.
	 * @access public
	 * @param int $id the ID number of the contact whose order is to be changed
	 * @param int $incrementor the amount to change the contact's order
	 */
	function changePositionOrder( $id, $incrementor )
	{
		$positionId = $this->getPositionIds( $id );
		$row =& $this->getTable( 'Positions' );
		$row->load( $positionId );
		$row->move( $incrementor, 'department_id = '. (int) $row->department_id );
	}

	/**
	 * Saves the ordering of contacts in the database.
	 * @access public
	 * @param array $cid the list of contact IDs of which the contact ordering needs
	 * to be saved.
	 */
	function saveOrder( $cid )
	{
		// get the position ids - they are indexed by contact id
		$positionIds = $this->getPositionIds( $cid );

		$total		= count( $cid );
		$order 		= JRequest::getVar( 'order', array(0), 'post', 'array' );
		JArrayHelper::toInteger($order, array(0));

		$row =& $this->getTable( 'Positions' );

		// update ordering values
		for( $i=0; $i < $total; $i++ ) {
			// load the position for the appropriate contact
			$row->load( (int) $positionIds[ $cid[$i] ] );

			if ($row->ordering != $order[$i]) {
				$row->ordering = $order[$i];
				if (!$row->store()) {
					JError::raiseError(500, $db->getErrorMsg() );
				}
			}
		}

		$msg 	= 'New ordering saved';

		return $msg;
	}

	/**
	 * Build a query for retrieving contacts based on the user state.
	 * @access public
	 * @return string the query
	 */
	function _getContactsQuery()
	{
		$this->_setUserState();
		if ( !$this->_query ) {
			$where = array();

			$select = array(
				'cd.*',
				'u.name AS user',
				'v.name AS editor',
				'g.name AS groupname'
			);

			$joins = ' LEFT JOIN #__groups AS g ON g.id = cd.access'
				. ' LEFT JOIN #__users AS u ON u.id = cd.user_id'
				. ' LEFT JOIN #__users AS v ON v.id = cd.checked_out';


			if ( $this->_search ) {
				$search = $this->_db->Quote( '%'.$this->_db->getEscaped( $this->_search, true ).'%', false );
				$where[] = '(cd.first_name LIKE '.$search.' OR cd.last_name LIKE '.$search.')';
			}

			if( $this->_filterCatId || $this->_filterSectionId ) {
				//join the categories through the positions table
				$joins .= ' INNER JOIN #__directory_contact_positions AS position ON position.contact_id = cd.id';
				$joins .= ' INNER JOIN #__directory_categories AS categories ON position.department_id = categories.id';

				// Filter by category and/or by section
				if ( $this->_filterCatId ) {
					$where[] = 'position.department_id = '.(int) $this->_filterCatId;
					$select[] = 'categories.title AS category, position.ordering AS ordering';

				}
				if ( $this->_filterSectionId ) {
					$where[] = 'categories.contact_section = '.(int) $this->_filterSectionId;
				}
			}

			if ( $this->_filterState ) {
				if ( $this->_filterState == 'P' ) {
					$where[] = 'cd.published = 1';
				} else if ($this->_filterState == 'U' ) {
					$where[] = 'cd.published = 0';
				}
			}

			if ($this->_filterOrder == 'cd.ordering' && $this->_filterCatId){
				$orderby 	= ' ORDER BY category, position.ordering'.' '.$this->_filterOrderDir;
			} else {
				$orderby 	= ' ORDER BY '. $this->_filterOrder .' '. $this->_filterOrderDir;
			}

			$where = ( count( $where ) ? ' WHERE ' . implode( ' AND ', $where ) : '' );
			// get the subset (based on limits) of required records


			$this->_query = 'SELECT ' . implode( ', ', $select )
				. ' FROM #__directory_contacts AS cd'
				. $joins
				. $where
				. $orderby;
		}
		return $this->_query;
	}
}
