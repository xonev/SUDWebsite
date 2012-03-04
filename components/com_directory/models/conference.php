<?php
/**
 * Lists churches in a conference.
 * @version $Id: conference.php 191 2009-03-17 06:16:27Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The model for listing churches.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryModelConference extends JModel
{
	/**
	 * The table that contains conferences
	 * @var string
	 */
	var $_table = '#__conferences';

	/**
	 * The table that contains church information
	 * @var string
	 */
	var $_churchTable = '#__churches';

	/**
	 * Whether or not a conference has been selected.
	 * @var bool
	 */
	var $_conferenceSelected = null;

	/**
	 * The id of the conference.
	 * @var int
	 */
	var $_id = null;

	/**
	 * The list of churches.
	 * @var array
	 */
	var $_churches = null;

	/**
	 * The total number of churches.
	 * @var int
	 */
	var $_totalChurches = null;

	/**
	 * The pagination object.
	 * @var object
	 */
	var $_pagination = null;

	/**
	 * The constructor
	 * @access public
	 */
	function __construct()
	{
		parent::__construct();
		$mainframe =& JApplication::getInstance( 'site' );
		global $option;

		$this->_setOrderBy();
		$this->_setOrderDir();

		// Get pagination request variables
		$limitstart = JRequest::getInt( 'limitstart', 0);
        $limit = $mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int');

        // In case limit has been changed, adjust it
        //$limitstart = ($limit != 0 ? (floor($limitstart / $limit) * $limit) : 0);

        $this->setState('limit', $limit);
        $this->setState('limitstart', $limitstart);

	}

	/**
	 * Get whether or not a conference has been selected.
	 * @access public
	 * @return bool whether or not a conference has been selected
	 */
	function getConferenceId()
	{
		if ( $this->_id == null ) {
			$this->_setId();
		}
		return $this->_id;
	}

	/**
	 * Retrieves the data for a conference.
	 * @access public
	 * @return object|bool the conference object or false if no conference was selected
	 */
	function getConference()
	{
		if ( $this->_id == null ) {
			$this->_setId();
		}

		if ( !$this->_id ) {
			return false;
		}

		$query = 'SELECT * FROM ' . $this->_table . ' WHERE id=' . $this->_id;

		$this->_db->setQuery( $query );
		return $this->_db->loadObject();
	}

	/**
	 * Sets the id of the conference.
	 * @access protected
	 */
	function _setId()
	{
		if ( $this->_id == null ) {
			$this->_id = JRequest::getVar( 'cid', 0 );
		}

		if ( $this->_id ) {
			JArrayHelper::toInteger( $this->_id );
			$this->_id = $this->_id[0];
		}
	}

	/**
	 * Gets the requested churches from the database.
	 * @access public
	 * @param string $orderBy the field to order by
	 * @param string $orderDir the direction to order
	 * @return array a list of churches
	 */
	function getChurches()
	{
		if ( !$this->_churches ) {
			$this->_setId();
			$query = $this->_getChurchesQuery();
			$this->_churches = $this->_getList( $query, $this->getState( 'limitstart' ), $this->getState( 'limit') );
			$this->_db->setQuery( 'SELECT FOUND_ROWS()' );
			$this->_totalChurches = $this->_db->loadResult();
		}
		return $this->_churches;
	}

	/**
	 * Builds the query for selecting churches in a conference
	 * @access protected
	 * @param string $orderby the field to order by
	 * @param string $orderdir the direction to order
	 * @return string
	 */
	function _getChurchesQuery()
	{
		$orderby = $this->getState( 'orderBy' );
		$orderdir = $this->getState( 'orderDir' );
		$select = array( 'church.id', 'church.name', 'church.city', 'states.name AS state' );
		$join = ' INNER JOIN #__states AS states ON states.id=church.state_id';
		
		if ($orderby == 'default' || empty( $orderby ) ) {
			$orderby = 'church.name';
		}

		if ( $this->_id ) {
			$where = 'church.conference_id=' . $this->_id;
		}
		else {
			$select[] = 'conference.name AS conference';
			$join .= ' INNER JOIN ' . $this->_table . ' AS conference ON conference.id=church.conference_id';
			$where = '1';
		}
		$query = 'SELECT SQL_CALC_FOUND_ROWS ' . implode( ', ', $select ) .
			' FROM ' . $this->_churchTable . ' AS church' .
			$join .
			' WHERE ' . $where .
			' ORDER BY ' . $orderby . ' ' . $orderdir;
		return $query;
	}

	/**
	 * Returns the pagination object.
	 * @access public
	 * @return object the pagination object
	 */
	function getPagination()
	{
		if ( empty( $this->_pagination ) ) {
			jimport( 'joomla.html.pagination' );

			$this->_pagination = new JPagination( 
				$this->getTotalChurches(), 
				$this->getState( 'limitstart' ), 
				$this->getState( 'limit' ) 
			);
		}

		return $this->_pagination;
	}

	/**
	 * Gets the total number of churches for the query.
	 * @access public
	 * @return int the number of churches for the query
	 */
	function getTotalChurches()
	{
		if ( empty( $this->_totalChurches ) ) {
			$query = $this->_getChurchesQuery();
			$this->_totalChurches = $this->_getListCount( $query );
		}
		return $this->_totalChurches;
	}
	
	/**
	 * Sets the orderBy state property.
	 * This property is used for keeping track of which column to order the query by.
	 * @access protected
	 */
	function _setOrderBy()
	{
		global $mainframe;
		$this->setState( 'orderBy', $mainframe->getUserStateFromRequest( $option . '.order_by', 'order_by', 'default', 'cmd' ) );
	}
	
	/**
	 * Sets the orderDir state property.
	 * This property is used to determine which direction to order the query (ASC or DESC)
	 * @access protected
	 */
	function _setOrderDir()
	{
		global $mainframe;
		$this->setState( 'orderDir', $mainframe->getUserStateFromRequest( $option . '.order_dir', 'order_dir', 'ASC', 'cmd' ) );
	}

	/**
	 * Retrieves the orderBy state property.
	 * This property is used for keeping track of which column to order the query by.
	 * @access public
	 * @return string the orderBy state property
	 */
	function getOrderBy()
	{
		if ( !$this->getState( 'orderBy' ) ) {
			$this->_setOrderBy();
		}
		return $this->getState( 'orderBy' );
	}

	/**
	 * Retrieves teh orderDir state property.
	 * This property is used to determine which direction to order the query (ASC or DESC)
	 * @access public
	 * @return string the orderDir state property
	 */
	function getOrderDir()
	{
		if ( !$this->getState( 'orderDir' ) ) {
			$this->_setOrderDir();
		}

		return $this->getState( 'orderDir' );
	}

}
