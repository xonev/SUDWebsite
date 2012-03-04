<?php
/**
 * Lists of conferences.
 * @version $Id: conferences.php 190 2009-03-17 06:02:43Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The model for listing churches.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryModelConferences extends JModel
{
	/**
	 * The table that stores conferences.
	 * @var string
	 */
	var $_table = '#__conferences';

	/**
	 * Retrieve conferences from the database.
	 * @access public
	 * @return array a list of conferences
	 */
	function getConferences()
	{
		$query = 'SELECT id, name FROM ' . $this->_table .
			' ORDER BY name ASC';
		$this->_db->setQuery( $query );
		$conferences = $this->_db->loadObjectList();
		return $conferences;
	}
}
