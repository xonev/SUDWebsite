<?php
/**
 * Contains the conference view.
 * @version $Id: view.html.php 175 2009-02-16 14:18:16Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The conference view (for editing a conference.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewConference extends JView
{
	/**
	 * @var object
	 */
	var $_conference;

	/**
	 * Displays the view.
	 * @access public
	 */
	function display($tpl = null)
	{
		$this->_conference = $this->get( 'Conference' );
		$title = $this->_conference->id > 0 ? 'Edit Conference' : 'Add Conference';
		JToolBarHelper::title( JText::_( $title ) );
		JToolBarHelper::apply();
		JToolBarHelper::save();
		JToolBarHelper::cancel();
		
		$this->assignRef( 'conference', $this->_conference );
		$this->assignRef( 'categorySelection', $this->_buildCategorySelection() );
		parent::display($tpl);
	}

	/**
	 * Builds a selection list of categories.
	 * @access protected
	 */
	function _buildCategorySelection()
	{
		//get the list of states and ids from the model
		$categoriesList = $this->get( 'Categories', 'Categories' );

		//Add a state selection prompt to the beginning of the list.
		$categorySelect = new stdClass();
		$categorySelect->id = 0;
		$categorySelect->name = JText::_( '--None--' );
		array_unshift( $categoriesList, $categorySelect );

		//build the selection list
		return JHTML::_( 'select.genericlist', $categoriesList, 'category_id',
				'class="inputbox" size="1" ', 'id', 'name',
				$this->_conference->category_id, 'category_id' );
	}
}
