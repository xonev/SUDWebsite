<?php
/**
 * @version		$Id: category.php 10381 2008-06-01 03:35:53Z pasamio $
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
class DirectoryModelCategory extends JModel
{
	/**
	 * Builds the query to select contact categories
	 * @param array
	 * @return string
	 * @access protected
	 */
	function _getCatgoriesQuery( &$options )
	{
		// TODO: Cache on the fingerprint of the arguments
		$db		=& JFactory::getDBO();
		$aid	= @$options['aid'];

		//$wheres[] = 'a.published = 1';
		$wheres[] = 'cc.section = ' . $db->Quote( 'com_directory' );
		$wheres[] = 'cc.published = 1';
		// if the contact section is specified, select only the entries from the
		// specified section
		$contactSection = @$options[ 'contact_section' ];
		if ( $contactSection > 0 ) {
			$wheres[] = 'cc.contact_section = ' . $contactSection;
		}

		if ($aid !== null)
		{
			//$wheres[] = 'a.access <= ' . (int) $aid;
			$wheres[] = 'cc.access <= ' . (int) $aid;
		}

		$groupBy	= 'cc.id';
		$orderBy	= 'cc.ordering' ;

		/*
		 * Query to retrieve all categories that belong under the contacts
		 * section and that are published.
		 */
		$query = 'SELECT cc.*'.
				' FROM #__directory_categories AS cc'.
				' WHERE ' . implode( ' AND ', $wheres ) .
				' GROUP BY ' . $groupBy .
				' ORDER BY ' . $orderBy;

		//echo $query;
		return $query;
	}

	/**
	 * Builds the query to select contact items
	 * @param array
	 * @return string
	 * @access protected
	 */
	function _getContactsQuery( &$options )
	{
		// TODO: Cache on the fingerprint of the arguments
		$db			=& JFactory::getDBO();
		$aid		= @$options['aid'];
		$catId		= @$options['category_id'];
		$groupBy	= @$options['group by'];
		$orderBy	= @$options['order by'];
		$contactSection = @$options[ 'contact_section' ];

		$select = 'cd.id, cd.name, cd.alias, cd.address, cd.suburb, cd.state, cd.country, cd.postcode, cd.telephone, ' .
				'cd.fax, cd.misc, cd.image, cd.imagepos, cd.email_to, cd.default_con, cd.published, cd.checked_out, ' .
				'cd.checked_out_time, cd.ordering, cd.params, cd.user_id, cd.catid, cd.access, cd.mobile, cd.webpage, ' .
				'cd.first_name, cd.last_name, ' .
				'cc.name AS category_name, cc.description AS category_description, cc.image AS category_image,'.
				' CASE WHEN CHAR_LENGTH(cd.alias) THEN CONCAT_WS(\':\', cd.id, cd.alias) ELSE cd.id END as slug, '.
				' CASE WHEN CHAR_LENGTH(cc.alias) THEN CONCAT_WS(\':\', cc.id, cc.alias) ELSE cc.id END as catslug ';
		if ($catId) {
			$select .= ', positions.position AS con_position';
		}
		
		$from	= '#__directory_contacts AS cd';
		
		// if a certain category is being selected, select contacts in that category
		if ($catId) {
			// join tables through the positions table like so:  contacts_details->contact_positions->categories
			$joins[] = 'INNER JOIN #__directory_contact_positions AS positions ON positions.contact_id = cd.id';
			$joins[] = 'INNER JOIN #__directory_categories AS cc ON positions.department_id = cc.id';
			// make sure the only the contacts in the selected category are selected
			$wheres[] = 'positions.department_id = ' . (int) $catId;
		}
		// otherwise, select all contacts ONCE
		else {
			//@TODO: this would probably not be necessary if this table was not referenced in the select clause
			// don't bother joing tables through the contact_positions table since the positions don't matter
			$joins[] = 'INNER JOIN #__directory_categories AS cc ON cc.id = cd.catid';
		}
		
		$wheres[] = 'cc.published = 1';
		$wheres[] = 'cd.published = 1';
		
		// if a certain contact section is being select, display only contacts from
		// that section
		if ( !empty( $contactSection ) ) {
			$wheres[] = 'cc.contact_section = ' . $contactSection;
		}

		if ($aid !== null)
		{
			$wheres[] = 'cc.access <= ' . (int) $aid;
			$wheres[] = 'cd.access <= ' . (int) $aid;
		}

		/*
		 * Query to retrieve all categories that belong under the contacts
		 * section and that are published.
		 */
		$query = 'SELECT ' . $select .
				' FROM ' . $from .
				' ' . implode ( ' ', $joins ) .
				' WHERE ' . implode( ' AND ', $wheres ) .
				($groupBy ? ' GROUP BY ' . $groupBy : '').
				($orderBy ? ' ORDER BY ' . $orderBy : '');
		return $query;
	}

	/**
	 * Gets a list of categories
	 * @param array
	 * @return array
	 */
	function getCategories( $options=array() )
	{
		$query	= $this->_getCatgoriesQuery( $options );
		return $this->_getList( $query /*, @$options['limitstart'], @$options['limit']*/ );
	}


	/**
	 * Retrieves the current category from the list of categories.
	 * @param array $categories a list of category objects
	 * @param int $categoryId the id of the current category
	 * @return object a category object
	 */
	function getCurrentCategory( $categories, $categoryId )
	{
		$category = null;
		foreach ($categories as $i => $_cat)
		{
			if ($_cat->id == $categoryId) {
				$category = &$categories[$i];
				break;
			}
		}
		if ($category == null) {
			$this->addTablePath( JPATH_BASE.DS.'components'.DS.'com_directory'.DS.'tables' );
			$category =& $this->getTable( 'directoryCategory' );
		}
		return $category;
	}

	/**
	 * Gets the count of the categories for the given options
	 * @param array
	 * @return int
	 */
	function getCategoryCount( $options=array() )
	{
		$query	= $this->_getCatgoriesQuery( $options );
		return $this->_getListCount( $query );
	}

	/**
	 * Gets a list of categories
	 * @param array
	 * @return array
	 */
	function getContacts( $options=array() )
	{
		$query	= $this->_getContactsQuery( $options );
		return $this->_getList( $query, @$options['limitstart'], @$options['limit'] );
	}

	/**
	 * Gets the count of the categories for the given options
	 * @param array
	 * @return int
	 */
	function getContactCount( $options=array() )
	{
		$query	= $this->_getContactsQuery( $options );
		return $this->_getListCount( $query );
	}
}
