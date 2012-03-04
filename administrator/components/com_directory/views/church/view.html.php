<?php
/**
 * The church view.
 * @version $Id: view.html.php 176 2009-02-17 09:28:41Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for editing a church.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewChurch extends JView
{
	/**
	 * The church object.
	 * @var object
	 */
	var $_church = null;

	/**
	 * Display the view.
	 * @access public
	 */
	function display( $tpl = null )
	{
		$this->_church = $this->get( 'Church' );
		$isNew = ( $this->_church->id < 1 );

		$title = $isNew ? 'Add Church' : 'Edit Church';
		JToolBarHelper::title( JText::_( $title ) );
		JToolBarHelper::apply();
		JToolBarHelper::save();
		JToolBarHelper::cancel();

		$this->assignRef( 'church', $this->_church );
		$this->assignRef( 'conferenceSelection', $this->_buildConferenceSelection() );
		$this->assignRef( 'stateSelection', $this->_buildStateSelection() );

		parent::display($tpl);
	}

	/**
	 * Builds a selection list of states.
	 * @access protected
	 * @return string HTML for the selection box
	 */
	function _buildStateSelection()
	{
		//get the list of states and ids from the model
		$stateList = $this->get( 'States', 'States' );

		//Add a state selection prompt to the beginning of the list.
		$selectState = new stdClass();
		$selectState->id = 0;
		$selectState->name = JText::_( '--Please Select a State--' );
		array_unshift( $stateList, $selectState );

		//build the selection list
		return JHTML::_( 'select.genericlist', $stateList, 'state_id',
				'class="inputbox" size="1" ', 'id', 'name',
				$this->_church->state_id, 'state_id' );
	}

	/**
	 * Builds a selection list of conferences.
	 * @access protected
	 * @return string HTML for the selection box
	 */
	function _buildConferenceSelection()
	{
		//get the list of conferences and ids from the model
		$conferenceList = $this->get( 'Conferences', 'Conferences' );

		//Add a conference selection prompt to the beginning of the list.
		$selectConference = new stdClass();
		$selectConference->id = 0;
		$selectConference->name = JText::_( '--Please Select a Conference--' );
		array_unshift( $conferenceList, $selectConference );

		//build the selection list
		return JHTML::_( 'select.genericlist', $conferenceList, 'conference_id',
				'class="inputbox" size="1" ', 'id', 'name',
				$this->_church->conference_id, 'conference_id' );
	}
}
