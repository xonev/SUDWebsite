<?php
/**
 * @version		$Id: contact.php 10381 2008-06-01 03:35:53Z pasamio $
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

jimport('joomla.application.component.model');

/**
 * @package		Joomla
 * @subpackage	Contact
 */
class DirectoryModelContact extends JModel
{
	/**
	 * Builds the query to select contact items
	 * @param array
	 * @return string
	 * @access protected
	 */
	function _getContactQuery( &$options )
	{
		// TODO: Cache on the fingerprint of the arguments
		$db			=& JFactory::getDBO();
		$aid		= @$options['aid'];
		$id			= @$options['id'];
		$groupBy	= @$options['group by'];
		$orderBy	= @$options['order by'];

		$select = 'a.*, cc.title as category_name, '
		. ' CASE WHEN CHAR_LENGTH(a.alias) THEN CONCAT_WS(\':\', a.id, a.alias) ELSE a.id END as slug, '
		. ' CASE WHEN CHAR_LENGTH(cc.alias) THEN CONCAT_WS(\':\', cc.id, cc.alias) ELSE cc.id END AS catslug ';
		$from	= '#__directory_contacts AS a';

		$joins[] = 'INNER JOIN #__directory_categories AS cc on cc.id = a.catid';

		$wheres[] = 'a.id = ' . (int) $id;
		$wheres[] = 'a.published = 1';
		$wheres[] = 'cc.published = 1';

		if ($aid !== null)
		{
			$wheres[] = 'a.access <= ' . (int) $aid;
			$wheres[] = 'cc.access <= ' . (int) $aid;
		}

		/*
		 * Query to retrieve all categories that belong under the contacts
		 * section and that are published.
		 */
		$query = 'SELECT ' . $select .
				' FROM ' . $from .
				' '. implode ( ' ', $joins ) .
				' WHERE ' . implode( ' AND ', $wheres );

		return $query;
	}
	
	function _getPositionsQuery( $options = array() ) {
		$id = @$options[ 'id' ];
		
		$select = 'department.title, positionTable.position, department.id as catid';
		$from = '#__directory_contact_positions AS positionTable';
		$joins[] = 'INNER JOIN #__directory_categories AS department ON positionTable.department_id = department.id';
		$wheres[] = 'positionTable.contact_id = ' . $id;
		
		$query = 'SELECT ' . $select .
			' FROM ' . $from .
			' ' . implode( ' ', $joins ) .
			' WHERE ' . implode( ' AND ', $wheres );
		//echo $query;
		return $query;
	}

	/**
	 * Gets a list of categories
	 * @param array
	 * @return mixed Object or null
	 */
	function getContact( $options=array() )
	{
		$query	= $this->_getContactQuery( $options );
		$result = $this->_getList( $query );
		return @$result[0];
	}
	
	/**
	 * Gets a list of positions the contact is in.
	 * @param array $options. Optional.
	 * @return mixed $result or null.
	 * @access public
	 */
	function getPositions( $options = array() ) {
		$query = $this->_getPositionsQuery( $options );
		$result = $this->_getList( $query );
		return $result;
	}
}
