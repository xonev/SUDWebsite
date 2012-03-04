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
jimport('joomla.client.helper');
jimport( 'joomla.application.component.view' );

class PhocaGalleryCpViewPhocaGalleryM extends JView
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

		$uri 			=& JFactory::getURI();
		$phocagallery	=& $this->get('Data');//Data from model
		$lists 			= array();		
		$db		        =& JFactory::getDBO();
		$document		= & JFactory::getDocument();
		
		$params = &JComponentHelper::getParams( 'com_phocagallery' );

		JToolBarHelper::title(   JText::_( 'Phoca gallery' ).': <small><small>[ ' . JText::_( 'Multiple Add' ).' ]</small></small>' );
		JToolBarHelper::save();
		JToolBarHelper::cancel();
		JToolBarHelper::help( 'screen.phocagallery', true );

		$phocagallery->published 	= 1;
		$phocagallery->order 		= 0;
		$phocagallery->catid 		= JRequest::getVar( 'catid', 0, 'post', 'int' );
		$phocagallery->id			= 0;

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

		//clean gallery data
		jimport('joomla.filter.output');
		JFilterOutput::objectHTMLSafe( $phocagallery, ENT_QUOTES, 'description' );
		
		
	
		$this->assignRef('lists', $lists);
		$this->assignRef('phocagallery', $phocagallery);
		$this->assignRef('button', $button);
		$this->assignRef('request_url',	$uri->toString());

		//--------------------------------------------------------------------------------------------------------
		/*image manager*/
		JResponse::allowCache(false);// Do not allow cache

		$path 			= PhocaGalleryHelper::getPathSet();
		
		
		// Upload Form ------------------------------------
		JHTML::_('behavior.mootools');
		//$document->addScript('components/com_phocagallery/assets/upload/mediamanager.js');
		$document->addStyleSheet('components/com_phocagallery/assets/upload/mediamanager.css');

		// Set FTP form
		$ftp = !JClientHelper::hasCredentials('ftp');
		
		// Set flash uploader if ftp password and login exists (will be not problems)
		$state			= $this->get('state');
		$refreshSite 	= 'index.php?option=com_phocagallery&view=phocagallerym&layout=form&hidemainmenu=1&folder='.$state->folder;
		if (!$ftp) {
			if ($params->get('enable_flash', 0)) {
				PhocaGalleryHelperUpload::uploader('file-upload', array('onAllComplete' => 'function(){ window.location.href="'.$refreshSite.'"; }'));
			}
		}
		
		// PARAMS - Upload size
		$upload_maxsize = 3000000;
		if ($params->get( 'upload_maxsize' ) != '') {
			$upload_maxsize = $params->get( 'upload_maxsize' );
		}
		// END Upload Form ------------------------------------
		
		
		$this->assignRef('session', JFactory::getSession());
		$this->assignRef('uploadmaxsize', $upload_maxsize);
		$this->assign('require_ftp', $ftp);

		$this->assignRef('path_orig_rel', $path['orig_rel_ds']);
		$this->assignRef('images', $this->get('images'));
		$this->assignRef('folders', $this->get('folders'));
		$this->assignRef('state', $this->get('state'));

		
		parent::display($tpl);
		echo JHTML::_('behavior.keepalive');
	}
}
?>
