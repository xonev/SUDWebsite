<?php
/**
 * The conference table.
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

/**
 * The table for conferences.
 * @package Joomla
 * @subpackage Directory
 */
class TableConference extends JTable
{
	/**
	 * @var int
	 */
	var $id = 0;

	/**
	 * @var string
	 */
	var $name = null;

	/**
	 * @var int
	 */
	var $category_id = 0;

	/**
	 * The constructor.
	 * @param object $db the connection object
	 * @access public
	 */
	function __construct( &$db )
	{
		parent::__construct( '#__conferences', 'id', $db );
	}

	/**
	 * Overloaded check function.
	 * @access public
	 * @return bool true if successful, false otherwise
	 */
	function check()
	{

		if ( $this->id == 0 ) {

			$table = $this->getTableName();
			$query = 'SELECT * FROM ' . $table . ' WHERE name = ' . $this->_db->Quote( $this->name );
			$this->_db->setQuery( $query );
			$matches = $this->_db->loadObjectList();
			if ( count($matches) > 0 ) {
				$this->setError( JText::_( 'There is already a conference with that name.' ) );
				return false;
			}

		}

		return true;
	}

	/**
	 * Overloaded store function.
	 * @access public
	 * @return int
	 */
	function store()
	{
		parent::store();
		return $this->id;
	}
}
