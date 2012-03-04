<?php
/**
 * Contains the view for a list of sections
 * @version $Id: view.html.php 208 2009-03-23 09:35:05Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for showing a list of sections
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewSections extends JView
{
	/**
	 * The default action.
	 * @param string $tpl the template to be displayed
	 */
	function display( $tpl = null )
	{
		JToolBarHelper::title( JText::_( 'Contact Sections Manager' ), 'generic.png' );
		JToolBarHelper::deleteList( 'Are you sure you want to delete the selected sections?', 'deletesection' );
		JToolBarHelper::editListX( 'editsection' );
		JToolBarHelper::addNewX( 'addsection' );
		$this->rows = $this->get( 'ContactSections' );
		parent::display( $tpl );
	}
}
