<?php
/**
 * Contains the church model.
 * @version $Id: church.php 221 2009-03-27 05:24:05Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The church model.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryModelChurch extends JModel
{
	/**
	 * The churches table
	 * @var string 
	 */
	var $_table = '#__churches';

	/**
	 * @var string
	 */
	var $_statesTable = '#__states';

	/**
	 * @var string
	 */
	var $_conferencesTable = '#__conferences';

	/**
	 * Retrieves the selected church from the database
	 * @access public
	 */
	function getChurch()
	{
		$cid = JRequest::getVar( 'cid', 0 );
		JArrayHelper::toInteger( $cid );
		$id = $cid[0];
		$query = $this->_getChurchQuery( $id );
		$this->_db->setQuery( $query );
		return $this->_db->loadObject();
	}

	/**
	 * Builds a query for retrieving a church from the database
	 * @access protected
	 * @param int the id of the church to be retrieved
	 * @return string the query
	 */
	function _getChurchQuery( $id )
	{
		$select = array( 'church.name',
			'church.id',
			'church.street',
			'church.street2',
			'church.city',
			'church.telephone',
			'conference.name AS conference',
			'state.name AS state'
		);

		$from = $this->_table . ' AS church' .
			' INNER JOIN ' . $this->_statesTable . ' AS state ON church.state_id=state.id ' .
			' INNER JOIN ' . $this->_conferencesTable . ' AS conference ON church.conference_id=conference.id';

		$query = 'SELECT ' . implode( ', ', $select ) .
			' FROM ' . $from .
			' WHERE church.id=' . $id;
		return $query;
	}

}
