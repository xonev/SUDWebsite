<?php
/**
 * Contains the conferences view.
 * @version $Id: view.html.php 174 2009-02-16 13:32:54Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The conferences view.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewConferences extends JView
{
	/**
	 * Displays the view.
	 * @access public
	 */
	function display($tpl = null)
	{
		JToolBarHelper::title( 'Conferences Manager' );
		JToolBarHelper::addNewX();
		JToolBarHelper::editListX();
		JToolBarHelper::deleteList( JText::_( 'Are you sure you want to delete the selected conferences?' ) );

		$conferences = $this->get( 'Conferences' );
		$this->assignRef( 'conferences', $conferences );
		parent::display( $tpl );
	}

}
