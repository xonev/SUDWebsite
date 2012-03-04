<?php
/**
 * @version $Id: conference.php 175 2009-02-16 14:18:16Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.controller' );

/**
 * The conferences controller.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminControllerConference extends JController
{
	/**
	 * The constructor.
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
		$this->registerTask( 'add', 'edit' );
	}

	/**
	 * Edits a conference.
	 * @access public
	 */
	function edit()
	{
		//pass the categories model to the view
		$view = $this->getView( 'conference', 'html' );
		$categoriesModel = $this->getModel( 'Categories' );
		$view->setModel( $categoriesModel );

		JRequest::setVar( 'view', 'conference' );
		parent::display();
	}

	/**
	 * Saves changes to a conference
	 * @access public
	 */
	function save()
	{
		$model =& $this->getModel( 'Conference' );
		$model->storeConference();
		$this->setRedirect(
			'index.php?option=com_directory&controller=conference&task=conferencelist',
			JText::_( 'Conference saved' )
		);
	}

	/**
	 * Applies changes to a conference
	 * @access public
	 */
	function apply()
	{
		$model =& $this->getModel( 'Conference' );
		$conferenceId = $model->storeConference();
		$this->setRedirect(
			'index.php?option=com_directory&controller=conference&task=edit&cid[]=' . $conferenceId,
			JText::_( 'Conference saved' )
		);
	}

	/**
	 * Cancels editing the conference.
	 * @access public
	 */
	function cancel()
	{
		$this->setRedirect( 'index.php?option=com_directory&controller=conference&task=conferencelist' );
	}

	/**
	 * Removes conferences.
	 * @access public
	 */
	function remove()
	{
		if ( !JRequest::checkToken() ) {
			JError::raiseError( '500', 'CSRF attack detected' );
		}
		$model = $this->getModel( 'Conferences' );
		$ids = JRequest::getVar( 'cid', array(0), 'post' );
		JArrayHelper::toInteger( $ids );
		$model->deleteConferences( $ids );

		$this->setRedirect(
			'index.php?option=com_directory&controller=conference&task=conferencelist',
			JText::_( 'Conferences deleted' )
		);
	}

	/**
	 * Shows a list of conferences.
	 * @access public
	 */
	function conferencelist()
	{
		JRequest::setVar( 'view', 'conferences' );
		parent::display();
	}
}
