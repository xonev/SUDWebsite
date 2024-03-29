<?php
/*
 * @package Joomla 1.5
 * @copyright Copyright (C) 2005 Open Source Matters. All rights reserved.
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
 *
 * @component Phoca Gallery
 * @copyright Copyright (C) Jan Pavelka www.phoca.cz
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL
 */
defined('_JEXEC') or die();
jimport( 'joomla.application.component.view' );

class PhocaGalleryCpViewPhocaGallery extends JView
{

	function display($tpl = null) {
		global $mainframe;
		
		if($this->getLayout() == 'form') {
			$this->_displayForm($tpl);
			return;
		}
		parent::display($tpl);
	}

	function _displayForm($tpl) {
		global $mainframe, $option;

		$db		=& JFactory::getDBO();
		$uri 	=& JFactory::getURI();
		$user 	=& JFactory::getUser();
		$model	=& $this->getModel();
		$editor =& JFactory::getEditor();

		//Data from model
		$phocagallery	=& $this->get('Data');
		
		JHTML::stylesheet( 'phocagallery.css', 'administrator/components/com_phocagallery/assets/' );
		
		//Image button
		$link = 'index.php?option=com_phocagallery&amp;view=phocagalleryi&amp;tmpl=component';
		JHTML::_('behavior.modal', 'a.modal-button');
		$button = new JObject();
		$button->set('modal', true);
		$button->set('link', $link);
		$button->set('text', JText::_( 'Image' ));
		$button->set('name', 'image');
		$button->set('modalname', 'modal-button');
		$button->set('options', "{handler: 'iframe', size: {x: 620, y: 400}}");
		
		
		$lists = array();		
		$isNew		= ($phocagallery->id < 1);

		// fail if checked out not by 'me'
		if ($model->isCheckedOut( $user->get('id') )) {
			
			$msg = JText::sprintf( 'DESCBEINGEDITTED', JText::_( 'Phoca gallery' ), $phocagallery->title );
			$mainframe->redirect( 'index.php?option='. $option, $msg );
		}

		// Set toolbar items for the page
		$text = $isNew ? JText::_( 'New' ) : JText::_( 'Edit' );
		JToolBarHelper::title(   JText::_( 'Phoca Gallery Image' ).': <small><small>[ ' . $text.' ]</small></small>', 'gallery' );
		JToolBarHelper::save();
		if ($isNew)  {
			JToolBarHelper::cancel();
		} else {
			// for existing items the button is renamed `close`
			JToolBarHelper::cancel( 'cancel', 'Close' );
		}
		JToolBarHelper::help( 'screen.phocagallery', true );

		// Edit or Create?
		if (!$isNew)
		{
			$model->checkout( $user->get('id') );
		}
		else
		{
			// initialise new record
			$phocagallery->published 	= 1;
			$phocagallery->order 		= 0;
			$phocagallery->catid 		= JRequest::getVar( 'catid', 0, 'post', 'int' );
		}

		// build the html select list for ordering
		$query = 'SELECT ordering AS value, title AS text'
			. ' FROM #__phocagallery'
			. ' WHERE catid = ' . (int) $phocagallery->catid
			. ' ORDER BY ordering';
		$lists['ordering'] 			= JHTML::_('list.specificordering',  $phocagallery, $phocagallery->id, $query, false );

		//------------------------------------------------------------------------
		//build the list of categories
		$query = 'SELECT a.title AS text, a.id AS value, a.parent_id as parentid'
		. ' FROM #__phocagallery_categories AS a'
	//	. ' WHERE a.published = 1'
		. ' ORDER BY a.ordering';
		$db->setQuery( $query );
		$phocagallerys = $db->loadObjectList();

		$tree = array();
		$text = '';
		$tree = PhocaGalleryHelper::CategoryTreeOption($phocagallerys, $tree, 0, $text, -1);
	//	$phocagallerys_tree_array = PhocaGalleryHelper::CategoryTreeCreating($phocagallerys, $tree, 0);
		array_unshift($tree, JHTML::_('select.option', '0', '- '.JText::_('Select Category').' -', 'value', 'text'));
		
		//list categories
		$lists['catid'] = JHTML::_( 'select.genericlist', $tree, 'catid',  '', 'value', 'text', $phocagallery->catid);
		//-----------------------------------------------------------------------
		
		
		// build the html select list
		$lists['published'] 		= JHTML::_('select.booleanlist',  'published', 'class="inputbox"', $phocagallery->published );

		

		// Params
		$videoCode 		= PhocaGalleryHelper::getParamsArray($phocagallery->params, 'videocode');
		$vmProductId 	= PhocaGalleryHelper::getParamsArray($phocagallery->params, 'vmproductid');
		
		//clean gallery data
		jimport('joomla.filter.output');
		JFilterOutput::objectHTMLSafe( $phocagallery, ENT_QUOTES, 'description' );
		
		$this->assignRef('editor', $editor);
		$this->assignRef('vmproductid', $vmProductId[0]);
		$this->assignRef('videocode', $videoCode[0]);
		$this->assignRef('lists', $lists);
		$this->assignRef('phocagallery', $phocagallery);
		$this->assignRef('button', $button);
		$this->assignRef('request_url',	$uri->toString());

		parent::display($tpl);
	}
}
?>
