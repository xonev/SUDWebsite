<?php
/**
 * Contains the view for displaying multiple contacts.
 * @version $Id: view.html.php 218 2009-03-26 08:59:11Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for displaying multiple contacts.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewContacts extends JView
{
	/**
	 * Displays the template
	 * @access public
	 * @param $tpl the template
	 */
	function display( $tpl = null )
	{
		$this->_setToolbarHelpers();
		
		//get the contacts
		$rows = $this->get( 'Contacts' );

		//get the pagination
		jimport('joomla.html.pagination');
		$pageNav = $this->get( 'Pagination' );

		// build list of categories
		$javascript = 'onchange="document.adminForm.submit();"';
		$emptyObject = new stdClass();
		$emptyObject->id = 0;
		$emptyObject->name = '- Select Category -';
		$categoriesList = $this->get( 'Categories', 'Categories' );
		array_unshift( $categoriesList, $emptyObject );
		$lists['catid'] = JHTML::_(
			'select.genericlist', $categoriesList, 'filter_catid',
			$javascript, 'id', 'name', $this->get( 'FilterCatId' )
		);

		// build list of sections
		$emptyObject->name = '- Select Section -';
		$sectionsList = $this->get( 'ContactSections', 'Sections' );
		array_unshift( $sectionsList, $emptyObject );
		$lists[ 'sectionid' ] = JHTML::_(
			'select.genericlist', $sectionsList, 'filter_sectionid',
			$javascript, 'id', 'name', $this->get( 'FilterSectionId' )
		);

		// state filter
		$lists['state']	= JHTML::_('grid.state',  $this->get( 'FilterState' ) );

		// table ordering
		$lists['order_Dir']	= $this->get( 'FilterOrderDir' );
		$lists['order']		= $this->get( 'FilterOrder' );

		// search filter
		$lists['search']= $this->get( 'Search' );

		global $option;

		$user =& JFactory::getUser();

		// Make the variables available to the template
		$this->assignRef( 'rows', $rows );
		$this->assignRef( 'pageNav', $pageNav );
		$this->assignRef( 'option', $option );
		$this->assignRef( 'lists', $lists );
		$this->assignRef( 'user', $user );
		$this->assignRef( 'showCategoryOrdering', $this->get( 'ShowCategoryOrdering' ) );
		
		parent::display( $tpl );
	}

	/**
	 * Sets the toolbar helpers (avoids duplicating code in both controllers)
	 * @access protected
	 */
	function _setToolbarHelpers()
	{
		JToolBarHelper::title( JText::_( 'Contact Manager' ), 'generic.png' );
		JToolBarHelper::publishList();
		JToolBarHelper::unpublishList();
		JToolBarHelper::deleteList();
		JToolBarHelper::editListX();
		JToolBarHelper::addNewX();
		JToolBarHelper::preferences('com_directory', '500');

		JToolBarHelper::help( 'screen.contactmanager' );
	}
}
