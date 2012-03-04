<?php
/**
 * Contains the view for a contact.
 * @version $Id: view.html.php 202 2009-03-19 10:48:02Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for a contact.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminViewContact extends JView
{
	/**
	 * Displays the template.
	 * @access public
	 * @param $tpl the template
	 */
	function display( $tpl = null )
	{
		$edit = JRequest::getCmd( 'task', 'add' );
		if ( $edit == 'add' ) {
			$edit = false;
		}
		else {
			$edit = true;
		}
		
		$db		=& JFactory::getDBO();
		$user 	=& JFactory::getUser();

		$cid 	= JRequest::getVar('cid', array(0), '', 'array');
		$option = JRequest::getCmd('option');
		$newPosition = JRequest::getBool( 'newPosition', false );

		JArrayHelper::toInteger($cid, array(0));

		$model =& $this->getModel();
		$row =& $this->get( 'Table' );
		// load the row from the db table and get positions
		if ($edit) {
			$row->load( $cid[0] );
			$positions = $model->getPositions( $db, $cid[0] );
		}

		if ($edit) {
			// do stuff for existing records
			$row->checkout($user->get('id'));
		} else {
			// do stuff for new records
			$row->imagepos 	= 'top';
			$row->ordering 	= 0;
			$row->published = 1;
		}
		$lists = array();

		// build the html select list for ordering
		$query = 'SELECT ordering AS value, last_name AS text'
		. ' FROM #__directory_contacts'
		. ' WHERE published >= 0'
		. ' AND catid = '.(int) $row->catid
		. ' ORDER BY ordering'
		;
		if($edit)
			$lists['ordering'] 			= JHTML::_('list.specificordering',  $row, $cid[0], $query );
		else
			$lists['ordering'] 			= JHTML::_('list.specificordering',  $row, '', $query );

		// build list of users
		$lists['user_id'] 			= JHTML::_('list.users',  'user_id', $row->user_id, 1, NULL, 'name', 0 );
		// build list of categories

		// build the category list for each position
		$departments = $this->get( 'Departments' );

		// if there are positions to be displayed
		if ( !empty( $positions ) ) {
			$index = 0;
			foreach ( $positions as $position ) {
				$lists['catid'][] = JHTML::_( 'select.genericlist', $departments, 'catid' . $index, 'class="inputbox" size="1" ', 'id', 'name', intval( $position->departmentId ) );
				//$lists['catid'][] = JHTML::_('list.category',  'catid' . $index, 'com_directory', intval( $position->departmentId ), null, 'text ASC' );
				$index++;
			}
			// if there is a new (blank) position
			if ( $newPosition ) {
				// build an unselected category list for the blank position
				$lists['catid'][] = JHTML::_( 'select.genericlist', $departments, 'catid' . $index, 'class="inputbox" size="1" ', 'id', 'name', 0 );
				//$lists['catid'][] = JHTML::_('list.category',  'catid' . $index, 'com_directory', 0, null, 'text ASC' );
			}
		}
		// otherwise build a blank category list
		else {
			$lists['catid'] = JHTML::_( 'select.genericlist', $departments, 'catid0', 'class="inputbox" size="1" ', 'id', 'name', intval( $row->catid ) );
			//$lists['catid'] = JHTML::_('list.category',  'catid0', 'com_directory', intval( $row->catid ), null, 'text ASC' );
		}
		// build the html select list for images
		$lists['image'] 			= JHTML::_('list.images',  'image', $row->image );
		// build the html select list for the group access
		$lists['access'] 			= JHTML::_('list.accesslevel',  $row );
		// build the html radio buttons for published
		$lists['published'] 		= JHTML::_('select.booleanlist',  'published', '', $row->published );
		// build the html radio buttons for default
		$lists['default_con'] 		= JHTML::_('select.booleanlist',  'default_con', '', $row->default_con );
		// pass the list of positions
		$lists['positions'] = $positions;

		// get params definitions
		$file 	= JPATH_ADMINISTRATOR .'/components/com_directory/contact_items.xml';
		$params = new JParameter( $row->params, $file, 'component' );

		jimport('joomla.html.pane');
		$pane = &JPane::getInstance('sliders', array('allowAllClose' => true));

		$cparams = JComponentHelper::getParams ('com_media');

		// Make variables available to the template
		$this->assignRef( 'row', $row );
		$this->assignRef( 'lists', $lists );
		$this->assignRef( 'option', $option );
		$this->assignRef( 'params', $params );
		$this->assignRef( 'pane', $pane );
		$this->assignRef( 'cparams', $cparams );

		parent::display($tpl);
	}

}
