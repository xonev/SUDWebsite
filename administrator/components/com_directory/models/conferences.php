<?php
/**
 * The conferences model.
 * @version $Id: conferences.php 174 2009-02-16 13:32:54Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The conferences model.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelConferences extends JModel
{
	/**
	 * The conferences table in the database.
	 * @var string
	 */
	var $_conferencesTable = '#__conferences';

	/**
	 * Retrieves the conferences from the database.
	 * @access public
	 * @return array a list of object with 'name' and 'id'
	 */
	function getConferences()
	{
		$query = 'SELECT id, name FROM ' . $this->_conferencesTable;
		$this->_db->setQuery( $query );
		return $this->_db->loadObjectList();
	}

	/**
	 * Insert a new conference into the database.
	 * @access public
	 * @param string $name the name of the conference
	 * @return bool|int the inserted id if successful, FALSE otherwise
	 */
	function insertConference( $name )
	{
		$conference = $this->getTable( 'Conference' );
		$conference->name = $name;
		if ( !$conference->check() ) {
			JError::raiseError( '500', $conference->getError() );
		}

		$message = $conference->store();
		if ( is_string($message) ) {
			JError::raiseError( '500', $message );
		}

		return $message;
	}

	/**
	 * Deletes all conferences from the database which are in the passed in list.
	 * @access public
	 * @param array $ids the list of ids to
	 */
	function deleteConferences( $ids )
	{
		$query = sprintf(
			'DELETE FROM %s WHERE `id` IN (%s)',
			$this->_db->nameQuote($this->_conferencesTable),
			implode( ', ', $ids )
		);

		$this->_db->setQuery( $query );

		if ( !$this->_db->query() ) {
			JError::raiseError( '500', $this->_db->getErrorMsg() );
		}
	}
}