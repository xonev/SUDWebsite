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

// no direct access
defined('_JEXEC') or die('Restricted access');

// Include library dependencies
jimport('joomla.filter.input');

class TablePhocaGallery extends JTable
{

	var $id = null;
	var $catid = null;
	var $sid = null;
	var $title = null;
	var $alias = null;
	var $filename = null;
	var $description = null;
	var $date = null;
	var $hits = null;
	var $published = null;
	var $checked_out = 0;
	var $checked_out_time = 0;
	var $ordering = null;
	var $params = null;

	function __construct(& $db) {
		parent::__construct('#__phocagallery', 'id', $db);
	}
}
?>