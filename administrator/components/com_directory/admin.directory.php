<?php
/**
* @version		$Id: admin.directory.php 217 2009-03-25 12:03:53Z adventi4 $
* @package		Joomla
* @subpackage	Contact
* @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * @TODO add authorization to the directories component.
 */
/*
 * Make sure the user is authorized to view this page
 */
$user = & JFactory::getUser();

/*if (!$user->authorize( 'com_directory', 'manage' )) {
	$mainframe->redirect( 'index.php', JText::_('ALERTNOTAUTH') );
}*/

/*
 * Controller code to help with moving this component over to MVC.
 */
	// Require the base controller
	require_once (JPATH_COMPONENT.DS.'controller.php');

	// Require specific controller if requested
	$controller = JRequest::getVar('controller');
	if ( !$controller ) {
		$controller = 'contacts';
	}
	if( $controller ) {
		require_once (JPATH_COMPONENT.DS.'controllers'.DS.$controller.'.php');
	}

	// Create the controller
	$classname	= 'DirectoryAdminController'.$controller;
	$controller = new $classname( );
/*
 * End controller initialization
 */

$task	= JRequest::getCmd('task');

$controller->execute($task);
$controller->redirect();
