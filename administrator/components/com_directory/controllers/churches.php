<?php
/**
 * @version $Id: churches.php 216 2009-03-24 06:39:34Z adventi4 $
 * The churches controller.
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.controller' );

/**
 * The controller for handling multiple churches.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminControllerChurches extends JController
{
	/**
	 * Displays the view.
	 * @access public
	 */
	function display()
	{
		parent::display();
	}

	/**
	 * Show a list of churches
	 * @access public
	 */
	function viewchurches()
	{
		JRequest::setVar( 'view', 'churches' );
		parent::display();
	}
}
