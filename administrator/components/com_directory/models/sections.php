<?php
/**
 * Contains the model for contact sections.
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The model for contact sections
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelSections extends JModel
{
	/**
	 * Retrieves a list of the contact sections from the database.
	 * @access public
	 */
	function getContactSections()
	{
		$select = 'id, name';
		$from = '#__directory_sections';
		$query = 'SELECT ' . $select .
			' FROM ' . $from;
		return $this->_getList( $query );
	}

	/**
	 * Retrieves a section from the database.
	 * @access public
	 * @param int $id the id of the section to retrieve
	 * @return object the section object
	 */
	function getSection( $id )
	{
		$query = 'SELECT * FROM #__directory_sections WHERE id=' . $id;
		$this->_db->setQuery( $query );
		return $this->_db->loadObject();
	}

	/**
	 * Saves a contact section to the database.
	 * @access public
	 * @return int the id of the contact in the database
	 */
	function saveSection()
	{
		$post = JRequest::get( 'post' );
		$row =& $this->getTable();
		if (!$row->bind( $post )) {
			JError::raiseError(500, $row->getError() );
		}

		// pre-save checks
		if (!$row->check()) {
			JError::raiseError(500, $row->getError() );
		}

		// save the changes
		if (!$row->store()) {
			JError::raiseError(500, $row->getError() );
		}

		return $row->id;
	}

	/**
	 * Deletes section(s) from the database.
	 * @access public
	 */
	function deleteSections( $sectionIds )
	{
		JArrayHelper::toInteger( $sectionIds );
		$this->_db->setQuery( $this->_deleteContactSectionsQuery( $sectionIds ) );
		if (!$this->_db->query()) {
				echo "<script> alert('".$this->_db->getErrorMsg(true)."'); window.history.go(-1); </script>\n";
		}
	}

	/**
	 * Builds a query for deleting contact sections from the database.
	 * @param array $sectionIds an array of section IDs to delete
	 */
	function _deleteContactSectionsQuery( $sectionIds )
	{
		$from = '#__directory_sections';
		$where = implode( ' OR id = ', $sectionIds );
		$query = 'DELETE FROM ' . $from . ' WHERE id IN(' . implode( ',', $sectionIds ) . ')';
		return $query;
	}
}
