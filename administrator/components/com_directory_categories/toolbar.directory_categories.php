<?php
/**
 * @version		$Id: toolbar.directory_categories.php 10381 2008-06-01 03:35:53Z pasamio $
 * @package		Joomla
 * @subpackage	DirectoryCategories
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

require_once( JApplicationHelper::getPath( 'toolbar_html' ) );

switch ($task)
{
	case 'add'  :
		TOOLBAR_directory_categories::_EDIT(false);
		break;

	case 'edit' :
	case 'editA':
		TOOLBAR_directory_categories::_EDIT(true);
		break;

	case 'moveselect':
	case 'movesave':
		TOOLBAR_directory_categories::_MOVE();
		break;

	case 'copyselect':
	case 'copysave':
		TOOLBAR_directory_categories::_COPY();
		break;

	default:
		TOOLBAR_directory_categories::_DEFAULT();
		break;
}