<?php
/**
 * @version		$Id: view.html.php 10880 2008-08-31 17:51:53Z willebil $
 * @package		Joomla
 * @subpackage	Contact
 * @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
 * @license		GNU/GPL, see LICENSE.php
 * Joomla! is free software. This version may have been modified pursuant to the
 * GNU General Public License, and as distributed it includes or is derivative
 * of works licensed under the GNU General Public License or other free or open
 * source software licenses. See COPYRIGHT.php for copyright notices and
 * details.
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.application.component.view');

/**
 * @package		Joomla
 * @subpackage	Directory
 */
class DirectoryViewCategory extends JView
{
	function display($tpl = null)
	{
		global $mainframe, $option;

		$user	  = &JFactory::getUser();
		$uri 	  =& JFactory::getURI();
		$model	  = &$this->getModel();
		$document =& JFactory::getDocument();

		$pparams = &$mainframe->getParams('com_directory');

		// Selected Request vars
		$categoryId			= JRequest::getVar('catid', 0, '', 'int');
		$limitstart			= JRequest::getVar('limitstart', 0, '', 'int');	
		$contactSection = JRequest::getVar( 'contact_section', 0, '', 'int');
		
		if ($categoryId == 0) {
			$pparams->set( 'show_position', false );
		}
		$pparams->def('display_num', $mainframe->getCfg('list_limit'));
		$default_limit = $pparams->def('display_num', 20);

		$limit = $mainframe->getUserStateFromRequest('com_directory.'.$this->getLayout().'.limit', 'limit', $default_limit, 'int');

		// query options
		$options['aid'] 		= $user->get('aid', 0);
		$options['category_id']	= $categoryId;
		$options['limit']		= $limit;
		$options['limitstart']	= $limitstart;
		$options['contact_section'] = $contactSection;
		
		// get ordering, depending on whether or not we are in administrators category
		$filterOrderDirection = JRequest::getVar( 'filter_order_Dir', 'ASC', '', 'word');
		$filterOrderBy = JRequest::getVar('filter_order', 'default', '', 'cmd');
		$options[ 'order by' ] = $this->_getOrdering( $categoryId, $filterOrderDirection, $filterOrderBy );
		//$options[ 'order by' ] = 'cd.last_name ASC';

		$categories	= $model->getCategories( $options );
		$contacts	= $model->getContacts( $options );
		$total 		= $model->getContactCount( $options );

		//add alternate feed link
		if($pparams->get('show_feed_link', 1) == 1)
		{
			$link	= '&format=feed&limitstart=';
			$attribs = array('type' => 'application/rss+xml', 'title' => 'RSS 2.0');
			$document->addHeadLink(JRoute::_($link.'&type=rss'), 'alternate', 'rel', $attribs);
			$attribs = array('type' => 'application/atom+xml', 'title' => 'Atom 1.0');
			$document->addHeadLink(JRoute::_($link.'&type=atom'), 'alternate', 'rel', $attribs);
		}

		//prepare contacts
		if($pparams->get('show_email', 0) == 1) {
			jimport('joomla.mail.helper');
		}

		$k = 0;
		for($i = 0; $i <  count( $contacts ); $i++)
		{
			$contact =& $contacts[$i];
			
			// if a certain category is selected, provide a link that will not generate a
			// category breadcrumb
			if ( $categoryId > 0 ) {
				$contact->link = JRoute::_('index.php?option=com_directory&view=contact&id='.$contact->slug.'&catid='.$contact->catslug);
			}
			// otherwise, provide a link that will generate the breadcrumb for the category
			// that the contact is selected from
			else {
				$contact->link = JRoute::_('index.php?option=com_directory&view=contact&id='.$contact->slug/*.'&catid='.$contact->catslug*/);
			}
			
			if ($pparams->get('show_email', 0) == 1) {
				$contact->email_to = trim($contact->email_to);
				if (!empty($contact->email_to) && JMailHelper::isEmailAddress($contact->email_to)) {
					$contact->email_to = JHTML::_('email.cloak', $contact->email_to);
				} else {
					$contact->email_to = '';
				}
			}

			$contact->odd	= $k;
			$contact->count = $i;
			$k = 1 - $k;
		}

		// find current category
		$category = $model->getCurrentCategory( $categories, $categoryId );
		

		$menus	= &JSite::getMenu();
		$menu	= $menus->getActive();

		// because the application sets a default page title, we need to get it
		// right from the menu item itself
		if (is_object( $menu )) {
			$menu_params = new JParameter( $menu->params );
			//if (!$menu_params->get( 'page_title')) {
			if ( !empty( $category->title ) ) {
				$pparams->set('page_title',	$category->title);
			}
			//}
		} else {
			$pparams->set('page_title',	$category->title);
		}
		$document->setTitle( $pparams->get( 'page_title' ) );

		// Prepare category description
		$category->description = JHTML::_('content.prepare', $category->description);

		// table ordering
		$lists['order_Dir'] = $filterOrderDirection;
		$lists['order'] = $filterOrderBy;
		$selected = '';
		
		if ( $category->id > 0 ) {
			$pathway =& $mainframe->getPathway();
			$pathway->addItem( $category->title, JRoute::_( 'index.php?option=com_directory&view=category&catid=' . $category->id ) );
		}
		jimport('joomla.html.pagination');
		$pagination = new JPagination($total, $limitstart, $limit);

		$this->assignRef('items',		$contacts);
		$this->assignRef('lists',		$lists);
		$this->assignRef('pagination',	$pagination);
		//$this->assignRef('data',		$data);
		$this->assignRef('category',	$category);
		$this->assignRef('params',		$pparams);

		$this->assign('action',		$uri->toString());

		parent::display($tpl);
	}
	
	/**
	 * Figures out the ordering to use on the page and returns a string indicating the appropriate ordering.
	 * @param int $categoryId passed in to determine if a category has been selected
	 * @return string SQL indicating the order in which the contacts should be retrieved.
	 */
	function _getOrdering( $categoryId, $filterOrderDirection, $filterOrderBy ) {
		$ordering = '';

		// if no ordering has been selected
		if ( $filterOrderBy == 'default' ) {
			if ( !empty( $categoryId ) ) {
				//order by ordering within the category, then order by group
				$ordering = sprintf( '%s %s, %s %s', 'positions.ordering', $filterOrderDirection, 'cd.last_name', $filterOrderDirection );
			}
			else {
				$ordering = sprintf( '%s %s', 'cd.last_name', $filterOrderDirection );
			}
		}
		// otherwise, order by the selected column, then by last name
		else {
			$ordering = sprintf( '%s %s', $filterOrderBy, $filterOrderDirection );
		}
		return $ordering;
	}

	function getItems()
	{

	}
}
