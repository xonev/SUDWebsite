<?php
/**
 * The churches model.
 * @version $Id: churches.php 188 2009-03-16 12:06:57Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.model' );

/**
 * The model for handling data for churches.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryAdminModelChurches extends JModel
{
	/**
	 * List of churches.
	 * @access protected
	 * @var array
	 */
	var $_churches = null;

	/**
	 * @access protected
	 * @var int
	 */
	var $_totalChurches = null;

	/**
	 * @access protected
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
	}

	/**
	 * Builds a query for retrieving churches.
	 * @access protected
	 * @return string the query
	 */
	function _getChurchesQuery()
	{
		$select = 'SQL_CALC_FOUND_ROWS church.id, church.name, church.city, states.name AS state, conferences.name AS conference';
		$from = '#__churches AS church';
		$joins = 'INNER JOIN #__states AS states ON states.id = church.state_id';
		$joins .= ' INNER JOIN #__conferences AS conferences ON conferences.id = church.conference_id';
		$wheres = '1';
		$orderBy = $this->getOrderBy();
		$orderDir = $this->getOrderDir();

		$query = 'SELECT ' . $select
			. ' FROM ' . $from
			. ' ' . $joins 
			. ' WHERE ' . $wheres;

		if ( $orderBy != 'default' && !empty( $orderBy ) ) {
			$query .= ' ORDER BY ' . $orderBy . ' ' . $orderDir;
		}

		return $query;
	}

	/**
	 * Retrieves data for churches.
	 * @access public
	 * @return array the desired data
	 */
	function getChurches()
	{
		if ( empty( $this->_churches ) ) {
			$query = $this->_getChurchesQuery();
			$this->_churches = $this->_getList( $query, $this->_getLimitStart(), $this->_getLimit() );
			$this->_db->setQuery( 'SELECT FOUND_ROWS()' );
			$this->_totalChurches = $this->_db->loadResult();
		}

		return $this->_churches;
	}

	/**
	 * Returns the current setting for the pagination limit. Either gets it from the global configuration
	 * or from the user state.
	 * @access protected
	 * @return int the limit of rows
	 */
	function _getLimit()
	{
		if ( !$this->getState( 'limit' ) ) {
			global $mainframe;
			$this->setState(
				'limit',
				(int)$mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int')
			);
		}
		return $this->getState( 'limit' );
	}

	/**
	 * Returns the pagination limit starting point.  Either returns 0 or gets the data from
	 * the request.
	 * @access protected
	 * @return int the limit start
	 */
	function _getLimitStart()
	{
		if ( !$this->getState( 'limitstart' ) ) {
			global $mainframe;
			$this->setState(
				'limitstart',
				(int)JRequest::getInt( 'limitstart', 0)
			);
		}
		return $this->getState( 'limitstart' );
	}

	/**
	 * Sets the orderBy state property.
	 * This property is used for keeping track of which column to order the query by.
	 * @access protected
	 */
	function _setOrderBy()
	{
		global $mainframe;
		$this->setState( 'orderBy', $mainframe->getUserStateFromRequest( $option . '.orderby', 'orderby', 'default', 'cmd' ) );
	}

	/**
	 * Sets the orderDir state property.
	 * This property is used to determine which direction to order the query (ASC or DESC)
	 * @access protected
	 */
	function _setOrderDir()
	{
		global $mainframe;
		$this->setState( 'orderDir', $mainframe->getUserStateFromRequest( $option . '.orderdir', 'orderdir', 'ASC', 'cmd' ) );
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

	/**
	 * Returns the total number of churches without pagination.
	 * @access public
	 * @return int the number of churches
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
				$this->_getLimitStart(),
				$this->_getLimit()
			);
		}

		return $this->_pagination;
	}
}
