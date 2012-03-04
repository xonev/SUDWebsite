<?php
/**
 * The categories model
 * @version $Id: categories.php 217 2009-03-25 12:03:53Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The categories model.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelCategories extends JModel
{
	/**
	 * @var string
	 */
	var $_table = '#__directory_categories';

	/**
	 * @var array
	 */
	var $_data = null;

	/**
	 * Retrieves categories in the directory section (id, name) from the database.
	 * @access public
	 * @return array the list of category objects
	 */
	function getCategories()
	{
		if ( empty( $this->_data ) ) {
			$query = sprintf( 'SELECT id, title AS name FROM %s ORDER BY title ASC',
				$this->_db->nameQuote( $this->_table )
			);

			$this->_db->setQuery( $query );

			$this->_data = $this->_db->loadObjectList();
		}

		return $this->_data;
	}

}
