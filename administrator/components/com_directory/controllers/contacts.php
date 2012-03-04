<?php
/**
 * Contains the controller for contacts.
 * @version $Id: contacts.php 218 2009-03-26 08:59:11Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.controller' );

/**
 * The controller for contacts.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminControllerContacts extends JController
{
	/**
	 * Custom constructor.
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
		$this->registerTask( 'add', 'edit' );
		$this->registerTask( 'addsection', 'editsection' );
	}

	/**
	 * The default display
	 * @access public
	 */
	function display()
	{
		JRequest::setVar( 'view', 'contacts' );
		$view =& $this->getView( 'contacts', 'html' );
		$categoriesModel =& $this->getModel( 'Categories' );
		$view->setModel( $categoriesModel );
		$sectionsModel =& $this->getModel( 'Sections' );
		$view->setModel( $sectionsModel );

		parent::display();
	}

	/**
	 * Edit a contact.
	 * @access public
	 */
	function edit()
	{
		$edit = JRequest::getCmd( 'task', 'add' );
		if ( $edit == 'edit' ) {
			$edit = true;
		}
		else {
			$edit = false;
		}
		
		$cid = JRequest::getVar( 'cid', array(0), '', 'array' );

		$text = ( $edit ? JText::_( 'Edit' ) : JText::_( 'New' ) );

		JToolBarHelper::title( JText::_( 'Contact' ) .': <small><small>[ '. $text .' ]</small></small>', 'generic.png' );

		//JToolBarHelper::custom( 'save2new', 'new.png', 'new_f2.png', 'Save & New', false,  false );
		//JToolBarHelper::custom( 'save2copy', 'copy.png', 'copy_f2.png', 'Save To Copy', false,  false );
		JToolBarHelper::save();
		JToolBarHelper::apply();

		if ( $edit ) {
			// for existing items the button is renamed `close`
			JToolBarHelper::cancel( 'cancel', 'Close' );
		} else {
			JToolBarHelper::cancel();
		}
		JToolBarHelper::help( 'screen.contactmanager.edit' );

		JRequest::setVar( 'hidemainmenu', 1 );
		JRequest::setVar( 'view', 'contact' );
		parent::display();
	}

	/**
	 * Save contact task.
	 * @access public
	 */
	function save()
	{
		$this->_saveContact();
		$msg	= JText::_( 'Contact saved' );
		$link	= 'index.php?option=com_directory';
		$this->setRedirect( $link, $msg );
	}

	/**
	 * Apply contact changes task.
	 * @access public
	 */
	function apply()
	{
		$id = $this->_saveContact();
		$msg	= JText::sprintf( 'Changes to X saved', 'Contact' );
		$link	= 'index.php?option=com_directory&controller=contacts&task=edit&cid[]='. $id .'';
		$this->setRedirect( $link, $msg );
	}

	/**
	 * Save contact changes to a copy task.
	 * @access public
	 */
	function save2copy()
	{
		$id = $this->_saveContact( true );
		$msg	= JText::sprintf( 'Changes to X saved', 'Contact' );
		$link	= 'index.php?option=com_directory&controller=contacts&task=edit&cid[]='. $id .'';
		$this->setRedirect( $link, $msg );
	}

	/**
	 * Save a new contact task.
	 * @access public
	 */
	function save2new()
	{
		$this->_saveContact();
		$msg	= JText::sprintf( 'Changes to X saved', 'Contact' );
		$link	= 'index.php?option=com_directory&controller=contacts&task=edit';
		$this->setRedirect( $link, $msg );
	}

	/**
	 * Save a contact in the database.
	 * @access protected
	 * @param $saveCopy whether or not a copy should be created
	 * @return int the return from the model's save contact method (the contact's id)
	 */
	function _saveContact( $saveCopy = false )
	{
		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		$model =& $this->getModel( 'Contact' );
		return $model->saveContact( $saveCopy );
	}

	/**
	 * Remove contacts task.
	 * @access public
	 */
	function remove()
	{
		$cid 	= $this->_getCidFromRequest();
		$model =& $this->getModel( 'Contact' );
		$result = $model->removeContacts( $cid );

		if ( $result !== true ) {
			echo "<script> alert('$result'); window.history.go(-1); </script>\n";
		}

		$this->setRedirect( 'index.php?option=com_directory' );
	}

	/**
	 * Publish contacts task.
	 * @access public
	 */
	function publish()
	{
		JRequest::checkToken() or jexit( 'Invalid Token' );
		$model =& $this->getModel( 'Contact' );
		$cid = $this->_getCidFromRequest();
		$model->changeContact( $cid, 1 );
		$this->setRedirect( 'index.php?option=com_directory' );
	}

	/**
	 * Unpublish contacts task.
	 * @access public
	 */
	function unpublish()
	{
		JRequest::checkToken() or jexit( 'Invalid Token' );
		$model =& $this->getModel( 'Contact' );
		$cid = $this->_getCidFromRequest();
		$model->changeContact( $cid, 0 );
		$this->setRedirect( 'index.php?option=com_directory' );
	}

	/**
	 * Changes the order of a contact - moves it up in the order.
	 * @access public
	 */
	function orderup()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$cid = $this->_getCidFromRequest();
		$model =& $this->getModel( 'Contacts' );
		$model->changePositionOrder( $cid[0], -1 );
		$this->setRedirect( 'index.php?option=com_directory' );
	}

	/**
	 * Changes the order of a contact - moves it down in the order.
	 * @access public
	 */
	function orderdown()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$cid = $this->_getCidFromRequest();
		$model =& $this->getModel( 'Contacts' );
		$model->changePositionOrder( $cid[0], 1 );
		$this->setRedirect( 'index.php?option=com_directory' );
	}

	/**
	 * Changes the contacts access to public.
	 * @access public
	 */
	function accesspublic()
	{
		$this->_changeAccess( 0 );
	}

	/**
	 * Changes the contacts access to registered.
	 * @access public
	 */
	function accessregistered()
	{
		$this->_changeAccess( 1 );
	}

	/**
	 * Changes the contacts access to special.
	 * @access public
	 */
	function accessspecial()
	{
		$this->_changeAccess( 2 );
	}

	/**
	 * Saves the ordering of the contacts in the list.
	 * @access public
	 */
	function saveorder()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$model =& $this->getModel( 'Contacts' );
		$cid = $this->_getCidFromRequest();
		$message = $model->saveOrder( $cid );
		$this->setRedirect( 'index.php?option=com_directory', $message );
	}

	/**
	 * Cancels the editing of a contact and checks the contact in.
	 * @access public
	 */
	function cancel()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$model =& $this->getModel( 'Contact' );
		$model->checkInContact();
		$this->setRedirect( 'index.php?option=com_directory' );
	}

	/**
	 * Displays a list of contact sections.
	 * @access public
	 */
	function showsections()
	{
		JRequest::setVar( 'view', 'sections' );
		parent::display();
	}

	/**
	 * Edit a new or existing contact section.
	 * @access public
	 */
	function editsection()
	{
		JRequest::setVar( 'view', 'section' );

		// Make the contacts model available to the view
		$view =& $this->getView( 'section', 'html' );
		$model =& $this->getModel( 'Sections' );
		$view->setModel( $model, true );

		parent::display();
	}

	/**
	 * Saves changes to a section.
	 * @access public
	 */
	function savesection()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$model =& $this->getModel( 'Sections' );
		$model->saveSection();
		$message = JText::_( 'Section Saved' );
		$this->setRedirect( 'index.php?option=com_directory&controller=contacts&task=showsections', $message );
	}

	/**
	 * Applies changes to a section.
	 * @access public
	 */
	function applysection()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$model =& $this->getModel( 'Sections' );
		$id = $model->saveSection();
		$message = JText::_( 'Section Saved' );
		$this->setRedirect(
			'index.php?option=com_directory&controller=contacts&task=editsection&sectionid[]=' . $id,
			$message
		);
	}

	/**
	 * Removes contact sections.
	 * @access public
	 */
	function deletesection()
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$sectionIds = JRequest::getVar( 'sectionid', array(0), '', 'array' );
		$model =& $this->getModel( 'Sections' );
		$model->deleteSections( $sectionIds );

		// redirect to showing contact sections
		// if more than one section was deleted
		if( count( $sectionIds > 1 ) ) {
			$msg = 'Section successfully deleted';
		}
		else {
			$msg = 'Sections successfully deleted';
		}
		$this->setRedirect( 'index.php?option=com_directory&task=showsections', $msg );
	}

	/**
	 * Changes the access of a contact.
	 * @access protected
	 */
	function _changeAccess( $access )
	{
		JRequest::checkToken() or jexit('Invalid Token');
		$cid = $this->_getCidFromRequest();
		$model =& $this->getModel( 'Contact' );
		$error = $model->changeContactAccess( $cid[0], $access );
		if ( $error ) {
			$msg = JText::sprintf( 'Contact access change failed: X', $error );
			$this->setRedirect( 'index.php?option=com_directory', $msg);
		}
		else {
			$this->setRedirect( 'index.php?option=com_directory' );
		}
	}

	/**
	 * Gets the cid parameter from the request.
	 * @access protected
	 * @return array $cid the array cid from the request
	 */
	function _getCidFromRequest()
	{
		return JRequest::getVar('cid', array(0), 'post', 'array');
	}
}
