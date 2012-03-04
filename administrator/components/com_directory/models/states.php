<?php
/**
 * The states model.
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The states model.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelStates extends JModel
{
	/**
	 * The table that the states are kept in
	 * @var string
	 * @access protected
	 */
	var $_statesTable = '#__states';

	/**
	 * The constructor.
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
	}

	/**
	 * Retrieves the states (and their ids) from the database - returned in a list.
	 * @access public
	 * @return array object containing the state and id
	 */
	function getStates()
	{
		$query = 'SELECT * FROM ' . $this->_statesTable;
		$this->_db->setQuery( $query );
		return $this->_db->loadObjectList();
	}
}
