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

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die();
require_once( JPATH_ADMINISTRATOR . DS.'components' .DS.'com_phocagallery'.DS.'helpers'.DS.'phocagallery.php' );

class JElementPhocagallery extends JElement
{

	var	$_name = 'PhocaGallery';

	function fetchElement($name, $value, &$node, $control_name)
	{
		$db = &JFactory::getDBO();

       //build the list of categories
		$query = 'SELECT a.title AS text, a.id AS value, a.parent_id as parentid'
		. ' FROM #__phocagallery_categories AS a'
		. ' WHERE a.published = 1'
		. ' ORDER BY a.ordering';
		$db->setQuery( $query );
		$phocagallerys = $db->loadObjectList();
		
		$tree = array();
		$text = '';
		//$tree = PhocaGalleryHelper::CategoryTree($phocagallerys, $tree, 0, $text);
		$tree = PhocaGalleryHelper::CategoryTreeOption($phocagallerys, $tree, 0, $text, -1);
		//$phocagallerys_tree_array = PhocaGalleryHelper::CategoryTreeCreating($phocagallerys, $tree, 0);
		array_unshift($tree, JHTML::_('select.option', '0', '- '.JText::_('Select Category').' -', 'value', 'text'));
		
	//array_unshift($gallerys, JHTML::_('select.option', '0', '- '.JText::_('Select gallery').' -', 'value', 'text'));

		return JHTML::_('select.genericlist',  $tree, ''.$control_name.'['.$name.']', 'class="inputbox"', 'value', 'text', $value, $control_name.$name );
	}
}
?>