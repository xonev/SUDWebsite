<?php

defined('_JEXEC') or die('Restricted access');

class DirectoryModelCategories extends JModel {
	
	/**
	 * Generates a query for selecting the categories from the database and returns it.
	 * @access private
	 * @param $options['aid'] the access id
	 * return $query the select query that will get all the categories
	 */
	function _getCategoriesQuery( &$options ) {
		$db =& JFactory::getDBO();
		$aid = @$options[ 'aid' ];
		$wheres = array();
		
		$wheres[] = 'category.section = ' . $db->Quote( 'com_directory' );
		$wheres[] = 'category.published = 1';
		// if a certain contact section was selected, only retrieve records from that section
		$contactSection = @$options[ 'contact_section' ];
		if ( $contactSection > 0 ) {
			$wheres[] = 'category.contact_section = ' . $contactSection;
		}
		
		if( $aid !== null ) {
			$wheres[] = 'category.access <= ' . (int) $aid;
		}
		
		$groupBy = 'category.id';
		$orderBy = 'category.title ASC';
		
		$query = 'SELECT category.id, category.title, category.name,' .
			' COUNT( category.id ) AS numlinks,' .
			' CASE WHEN CHAR_LENGTH( category.alias ) THEN CONCAT_WS( \':\', category.id, category.alias ) ELSE category.id END AS catslug' .
			' FROM #__directory_categories as category' .
			' WHERE ' . implode( ' AND ', $wheres ) .
			' GROUP BY ' . $groupBy .
			' ORDER BY ' . $orderBy;
		return $query;
	}
	
	/**
	 * Returns a list of all of the contact component categories and their associated data.
	 * @access public
	 * @param [$options] options to be passed to _getList and an access id to determine what \
	 * to get from the database.
	 * @return the list of all qContacts categories and associated data.
	 */
	function getCategories( $options = array() ) {
		$query = $this->_getCategoriesQuery( $options );
		return $this->_getList( $query, @$options[ 'limitstart' ], @$options[ 'limit' ] );
	}
	
}
