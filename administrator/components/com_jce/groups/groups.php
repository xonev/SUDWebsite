<?php
/**
 * @version		$Id: plugin.php 7074 2007-03-31 15:37:23Z jinx $
 * @package		Joomla.Framework
 * @subpackage	Table
 * @copyright	Copyright (C) 2005 - 2007 Open Source Matters. All rights reserved.
 * @license		GNU/GPL, see LICENSE.php
 * Joomla! is free software. This version may have been modified pursuant
 * to the GNU General Public License, and as distributed it includes or
 * is derivative of works licensed under the GNU General Public License or
 * other free or open source software licenses.
 * See COPYRIGHT.php for copyright notices and details.
 */

// Check to ensure this file is within the rest of the framework
defined('JPATH_BASE') or die();

/**
 * Plugin table
 *
 * @package 	Joomla.Framework
 * @subpackage		Table
 * @since	1.0
 */
class JCETableGroups extends JTable
{
	/**
	 * Primary Key
	 *
	 *  @var int
	 */
	var $id = null;

	/**
	 *
	 *
	 * @var varchar
	 */
	var $name = null;
	
	/**
	 *
	 *
	 * @var varchar
	 */
	var $description = null;

	/**
	 *
	 *
	 * @var varchar
	 */
	var $components = null;
	
	/**
	 *
	 *
	 * @var varchar
	 */
	var $users = null;
	
	/**
	 *
	 *
	 * @var varchar
	 */
	var $types = null;
	
	/**
	 *
	 *
	 * @var varchar
	 */
	var $rows = null;
	
	/**
	 *
	 *
	 * @var varchar
	 */
	var $plugins = null;

	/**
	 *
	 *
	 * @var tinyint
	 */
	var $published = 0;
	
	/**
	 *
	 *
	 * @var tinyint
	 */
	var $ordering = 1;

	/**
	 *
	 *
	 * @var int unsigned
	 */
	var $checked_out = 0;

	/**
	 *
	 *
	 * @var datetime
	 */
	var $checked_out_time = 0;

	/**
	 *
	 *
	 * @var text
	 */
	var $params = null;

	function __construct(& $db) {
		parent::__construct('#__jce_groups', 'id', $db);
	}

	/**
	* Overloaded bind function
	*
	* @access public
	* @param array $hash named array
	* @return null|string	null is operation was satisfactory, otherwise returns an error
	* @see JTable:bind
	* @since 1.5
	*/
	function bind($array, $ignore = '')
	{
		if (isset( $array['params'] ) && is_array($array['params']))
		{
			$registry = new JRegistry();
			$registry->loadArray($array['params']);
			$array['params'] = $registry->toString();
		}

		return parent::bind($array, $ignore);
	}
}
?>