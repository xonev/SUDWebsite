<?php
/**
 * @version $Id: view.html.php 209 2009-03-23 10:13:42Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * View for adding or editing a contact section
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewSection extends JView
{
	/**
	 * The default display action.
	 * @access public
	 */
	function display( $tpl = null )
	{
		$this->editSection( $tpl );
	}

	/**
	 * The action for editing a section.
	 * @access public
	 */
	function editSection( $tpl = null )
	{
		$sectionId = JRequest::getVar( 'sectionid', array(0), '', 'array' );
		$edit = empty( $sectionId ) ? false : true;
		
		$text = ( $edit ? JText::_( 'Edit' ) : JText::_( 'New' ) );

		JToolBarHelper::title( JText::_( 'Contact Section' ) . ': <small><small>[ ' . $text . ' ]</small></small>', 'generic.png' );
		JToolBarHelper::save( 'savesection' );
		JToolBarHelper::apply( 'applysection' );

		if ( $edit ) {
			JToolBarHelper::cancel( 'showsections', 'Close' );
		}
		else {
			JToolBarHelper::cancel( 'showsections' );
		}
		JRequest::setVar( 'hidemainmenu', 1 );

		
		if ( $edit ) {
			$model =& $this->getModel();
			$this->section = $model->getSection( (int) $sectionId[0] );
		}
		else {
			$this->section = new stdClass();
			$this->section->id = 0;
			$this->section->name = '';
		}
		
		parent::display( $tpl );
	}
}
