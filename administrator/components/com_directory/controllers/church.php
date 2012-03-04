<?php
/**
 * The church controller
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.controller' );

/**
 * The controller for manipulating a church.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminControllerChurch extends JController
{
	/**
	 * The constructor.
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
		$this->registerTask('add', 'edit');
	}

	/**
	 * The edit method - edit a church.
	 * @access public
	 */
	function edit()
	{
		JRequest::setVar( 'view', 'church' );
		JRequest::setVar( 'hidemainmenu', '1' );
		$view =& $this->getView( 'church', 'html' );
		$view->setModel( $this->getModel( 'States' ) );
		$view->setModel( $this->getModel( 'Conferences' ) );
		parent::display();
	}

	/**
	 * Save the church submitted.
	 * @access public
	 */
	function save()
	{
		$this->_storeChurch();
		$this->setMessage( 'Church saved' );
		$this->setRedirect( 'index.php?option=com_directory&controller=churches&task=viewchurches' );
	}

	/**
	 * Apply changes to the church.
	 * @access public
	 */
	function apply()
	{
		$churchId = $this->_storeChurch();
		$this->setMessage( 'Church saved' );
		$this->setRedirect( 'index.php?option=com_directory&controller=church&task=edit&cid[]=' . $churchId );
	}

	/**
	 * Cancel editing the church.
	 * @access public
	 */
	function cancel()
	{
		$this->setRedirect( 'index.php?option=com_directory&controller=churches&task=viewchurches' );
	}

	/**
	 * Deletes selected churches
	 * @access public
	 */
	function remove()
	{
		if ( !JRequest::checkToken() ) {
			JError::raiseError( '500', 'CSRF attack detected' );
		}
		$church = $this->getModel( 'Church' );
		$ids = JRequest::getVar( 'cid', array(0), 'post' );
		JArrayHelper::toInteger( $ids );
		$church->deleteChurches( $ids );

		$this->setRedirect(
			'index.php?option=com_directory&controller=churches&task=viewchurches',
			JText::_( 'Churches deleted' )
		);
	}

	/**
	 * Store the church in the database.  Return the id of the church.
	 * @access protected
	 * @return int the id of the church
	 */
	function _storeChurch()
	{
		if ( !JRequest::checkToken() ) {
			JError::raiseError( '500', 'CSRF Attack detected' );
		}
		//find out if the conference is new or existing
		$conferenceName = JRequest::getString( 'conference_name', '', 'post' );
		if ( !empty($conferenceName) ) {
			//if it is not existing than insert a new conference before continuing
			$Conferences = $this->getModel( 'Conferences' );
			$conferenceId = $Conferences->insertConference( $conferenceName );
			JRequest::setVar( 'conference_id', $conferenceId, 'post', true );
		}

		//insert the church
		$Church = $this->getModel( 'Church' );
		return $Church->saveChurch();
	}
}
