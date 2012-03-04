<?php
/**
 * @version $Id: view.html.php 187 2009-03-13 07:30:44Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport('joomla.application.component.view');

/**
 * The default directory view.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewDirectoryAdmin extends JView
{
	/**
	 * Displays the view.
	 * @access public
	 */
	function display()
	{

		$get = JRequest::get( 'get' );
		var_dump( $get );
		$post = JRequest::get( 'post' );
		var_dump( $post );
		parent::display();
	}
}
