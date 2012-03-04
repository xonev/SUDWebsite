<?php
/**
 * The church table
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * The church table
 * @package Joomla
 * @subpackage Directory
 */
class TableChurch extends JTable
{
	/**
	 * The id of the church
	 * @var int
	 */
	var $id = 0;

	/**
	 * The name of the church
	 * @var string
	 */
	var $name = null;

	/**
	 * The street address of the church
	 * @var string
	 */
	var $street = null;

	/**
	 * The second street address of the church
	 * @var string
	 */
	var $street2 = null;

	/**
	 * The city of the church
	 * @var string
	 */
	var $city = null;

	/**
	 * The id of the state in the states table
	 * @var int
	 */
	var $state_id = 0;

	/**
	 * The id of the conference in the conferences table
	 * @var int
	 */
	var $conference_id = 0;

	/**
	 * The telephone number for the church (or pastor)
	 * @var string
	 */
	var $telephone = null;

	/**
	 * The constructor.
	 * @access public
	 * @param object $db the database connection object
	 */
	function __construct( &$db )
	{
		parent::__construct( '#__churches', 'id', $db );
	}

	/**
	 * Overloaded check function - do input validation.
	 * @access public
	 */
	function check()
	{
		return true;
	}
}
