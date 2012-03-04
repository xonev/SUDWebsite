<?php

defined( '_JEXEC' ) or die( 'Restricted access' );

class TableSections extends JTable
{
	/** @var int */
	var $id = 0;
	/** @var string */
	var $name;
	
	function __construct( &$db ) {
		parent::__construct( '#__directory_sections', 'id', $db );
	}
	
	function stop( $msg ) {
		global $mainframe;
		echo '<pre>' . var_dump($msg) . '</pre>';
		$mainframe->close();
	}
}
