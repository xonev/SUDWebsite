<?php

defined('_JEXEC') or die('Restricted access');

function com_install() {
	require_once( JPATH_ADMINISTRATOR .DS. 'components' .DS. 'com_jce' .DS. 'helper.php' );
	
	// Install Plugins data
	JCEHelper::installPlugins( true );
	
	// Install Groups data
	JCEHelper::installGroups( true );

	// Update DB
	JCEHelper::updateDB( true );
}
function com_uninstall() {}
?>