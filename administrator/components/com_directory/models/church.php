<?php
/**
 * The church model.
 * @version $Id: church.php 183 2009-03-12 04:59:11Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The model for retrieving information about a church.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelChurch extends JModel
{
	/**
	 * The name of the church table in the database
	 * @var string
	 */
	var $_churchesTable = '#__churches';

	/**
	 * The id of the church
	 * @var int
	 */
	var $_id;

	/**
	 * The data for the church
	 * @var object
	 */
	var $_data;

	/**
	 * Constructor that gets the id from request.
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
		$cid = JRequest::getVar( 'cid', array(0) );
		JArrayHelper::toInteger( $cid, array(0) );
		$this->setId( $cid[0] );
		$this->_data = null;
	}

	/**
	 * Sets the private id member.
	 * @access public
	 * @param int $id the id to be set to
	 */
	function setId( $id )
	{
		$this->_id = $id;
	}

	/**
	 * Gets the data for the church.
	 * @access public
	 * @return object the data
	 */
	function getChurch()
	{
		if ( empty($this->_data) ) {
			$query = sprintf( 'SELECT * FROM %s WHERE id=%d', $this->_db->nameQuote( $this->_churchesTable ),
				$this->_id );
			$this->_db->setQuery( $query );
			$this->_data = $this->_db->loadObject();
		}

		if ( !$this->_data ) {
			$this->_data =& $this->getTable();
		}

		return $this->_data;
	}

	/**
	 * Saves a church with values bound from post.  Returns the id of the church.
	 * @access public
	 * @return int the id of the church
	 */
	function saveChurch()
	{
		$church = $this->getTable();
		$churchId = JRequest::getInt( 'id', 0, 'post' );
		$post = JRequest::get( 'post' );
		var_dump( $post );
		if ( !$church->bind( $post ) ) {
			JError::raiseError( '500', $church->getError() );
		}

		if ( !$church->check() ) {
			JError::raiseError( '500', $church->getError() );
		}

		if ( !$church->store() ) {
			JError::raiseError( '500', $church->getError() );
		}

		//if it is an existing church
		if ( $churchId > 0 ) {
			return $churchId;
		}
		else {
			return $this->_db->insertid();
		}
	}

	/**
	 * Deletes churches from the database.
	 * All the churches that have an id in the list passed in.
	 * @access public
	 * @param array $ids an integer of ids to be deleted
	 */
	function deleteChurches( $ids )
	{
		$query = sprintf(
			'DELETE FROM %s WHERE `id` IN (%s)',
			$this->_db->nameQuote($this->_churchesTable),
			implode( ', ', $ids )
		);

		$this->_db->setQuery( $query );

		if ( !$this->_db->query() ) {
			JError::raiseError( '500', $this->_db->getErrorMsg() );
		}
	}
}