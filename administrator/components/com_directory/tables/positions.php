<?php

defined( '_JEXEC' ) or die( 'Restricted access' );

class TablePositions extends JTable
{
	/** @var int */
	var $id = 0;
	/** @var int */
	var $contact_id = 0;
	/** @var int */
	var $department_id = 0;
	/** @var string */
	var $position = null;
	/** @var int */
	var $ordering = null;
	
	function __construct( &$db ) {
		parent::__construct( '#__directory_contact_positions', 'id', $db );
	}
	
	function stop( $msg ) {
		global $mainframe;
		echo '<pre>' . var_dump($msg) . '</pre>';
		$mainframe->close();
	}
}
