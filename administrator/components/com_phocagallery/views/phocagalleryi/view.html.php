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
jimport( 'joomla.application.component.view');

class PhocaGalleryCpViewPhocagalleryI extends JView
{
	function display($tpl = null) {
		global $mainframe;

		$params = &JComponentHelper::getParams( 'com_phocagallery' );
		
		// Do not allow cache
		JResponse::allowCache(false);
		
		$document		= & JFactory::getDocument();
		$document->addStyleSheet('../administrator/components/com_phocagallery/assets/phocagallery.css');
		$document->addStyleSheet('../administrator/templates/system/css/system.css');

		$document->addCustomTag("<!--[if IE]>\n<link rel=\"stylesheet\" href=\"../administrator/components/com_phocagallery/assets/phocagalleryieall.css\" type=\"text/css\" />\n<![endif]-->");

		$path 			= PhocaGalleryHelper::getPathSet();
		$path_orig_rel 	= $path['orig_rel_ds'];
		$this->assign('path_orig_rel', $path_orig_rel);
		$this->assignRef('images', $this->get('images'));
		$this->assignRef('folders', $this->get('folders'));
		$this->assignRef('state', $this->get('state'));
		
	
		// Upload Form ------------------------------------
		JHTML::_('behavior.mootools');
		//$document->addScript('components/com_phocagallery/assets/upload/mediamanager.js');
		$document->addStyleSheet('components/com_phocagallery/assets/upload/mediamanager.css');

		// Set FTP form
		$ftp = !JClientHelper::hasCredentials('ftp');
		
		// Set flash uploader if ftp password and login exists (will be not problems)
		$state			= $this->get('state');
		$refreshSite 	= 'index.php?option=com_phocagallery&view=phocagalleryi&tmpl=component&folder='.$state->folder;
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

		parent::display($tpl);
		echo JHTML::_('behavior.keepalive');
	}

	function setFolder($index = 0)
	{
		if (isset($this->folders[$index])) {
			$this->_tmp_folder = &$this->folders[$index];
		} else {
			$this->_tmp_folder = new JObject;
		}
	}

	function setImage($index = 0)
	{
		if (isset($this->images[$index])) {
			$this->_tmp_img = &$this->images[$index];
		} else {
			$this->_tmp_img = new JObject;
		}
	}
}
?>