<?php
/**
 * @version $Id: controller.php 214 2009-03-24 05:10:38Z adventi4 $
 * Directory default controller.
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport('joomla.application.component.controller');

/**
 * Directory administrator controller.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminController extends JController
{
	/**
	 * Default display.
	 * @access public
	 */
	function display()
	{
		JRequest::setVar( 'view', 'contacts' );
		parent::display();
	}
}