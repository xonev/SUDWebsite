<?php
/**
 * contains the conference model.
 * @version $Id: conference.php 175 2009-02-16 14:18:16Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The conference model
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelConference extends JModel
{
	/**
	 * @var string
	 */
	var $_table = '#__conferences';

	/**
	 * @var object
	 */
	var $_data;

	/**
	 * The id of the conference.
	 * @var int
	 */
	var $_id;

	/**
	 * The constructor.
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
		$ids = JRequest::getVar( 'cid', array(0) );
		JArrayHelper::toInteger( $ids, array(0) );
		$this->_id = $ids[0];
		$this->_data = null;
	}

	/**
	 * Retrieves a conference from the database (if it exists).
	 * Returns an object with empty values if the object does not exist.
	 * @access public
	 * @return object the conference
	 */
	function getConference()
	{
		if ( empty( $this->_data ) ) {

			$query = sprintf( 'SELECT * FROM %s WHERE id=%d',
				$this->_db->nameQuote( $this->_table ),
				$this->_id
			);
			
			$this->_db->setQuery( $query );
			$this->_data = $this->_db->loadObject();
		}

		if ( !$this->_data ) {
			$this->_data =& $this->getTable();
		}

		return $this->_data;
	}

	/**
	 * Saves a conference to the database.
	 * @access public
	 * @return int the id of the conference
	 */
	function storeConference()
	{
		$post = JRequest::get( 'post' );
		$id = JRequest::getInt( 'id', 0, 'post' );
		$conference = $this->getTable();

		if ( !$conference->bind( $post ) ) {
			JError::raiseError( '500', 'Bind error' );
		}

		if ( !$conference->check() ) {
			JError::raiseError( '500', 'Check error' );
		}

		if ( !$conference->store() ) {
			JError::raiseError( '500', 'Store error' );
		}

		if ( $id > 0 ) {
			return $id;
		}

		return $this->_db->insertid();
	}

}

