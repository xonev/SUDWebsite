<?php
/**
 * The churches view.
 * @version $Id: view.html.php 188 2009-03-16 12:06:57Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for showing the administrative interface of a church list.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewChurches extends JView
{
	/**
	 * Display a list of churches
	 * @access public
	 */
	function display($tpl = null)
	{
		JToolBarHelper::title( JText::_( 'Churches Manager' ), 'generic.png' );
		JToolBarHelper::addNewX();
		JToolBarHelper::editListX();
		JToolBarHelper::deleteList('Are you sure you would like to delete the selected churches?');

		$churches =& $this->get( 'Churches' );
		$pagination =& $this->get( 'Pagination' );
		$orderBy =& $this->get( 'orderBy' );
		$orderDir =& $this->get( 'orderDir' );
		$this->assignRef( 'pagination', $pagination );
		$this->assignRef( 'churches', $churches );
		$this->assignRef( 'orderBy', $orderBy );
		$this->assignRef( 'orderDir', $orderDir );


		$uri =& JFactory::getURI();
		$this->assign( 'action', $uri->toString() );

		parent::display($tpl);
	}

}
