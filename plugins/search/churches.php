<?php
/**
 * @version $Id$
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

$mainframe->registerEvent( 'onSearch', 'plgSearchChurches' );
$mainframe->registerEvent( 'onSearchAreas', 'plgSearchChurchAreas' );

//JPlugin::loadLanguage( 'plg_search_contacts' );

/**
 * @return array An array of search areas
 */
function &plgSearchChurchAreas()
{
	static $areas = array(
		'contacts' => 'Contacts'
	);
	return $areas;
}

/**
* Churches Search method
*
* The sql must return the following fields that are used in a common display
* routine: href, title, section, created, text, browsernav
* @param string Target search string
* @param string matching option, exact|any|all
* @param string ordering option, newest|oldest|popular|alpha|category
*/
function plgSearchChurches( $text, $phrase='', $ordering='', $areas=null )
{
	$db		=& JFactory::getDBO();
	$user	=& JFactory::getUser();

	if (is_array( $areas )) {
		if (!array_intersect( $areas, array_keys( plgSearchChurchAreas() ) )) {
			return array();
		}
	}

	// load plugin params info
 	$plugin =& JPluginHelper::getPlugin('search', 'churches');
 	$pluginParams = new JParameter( $plugin->params );

	$limit = $pluginParams->def( 'search_limit', 50 );

	$text = trim( $text );
	if ($text == '') {
		return array();
	}

	$section = JText::_( 'Churches' );

	switch ( $ordering ) {
		case 'alpha':
			$order = 'church.name ASC';
			break;

		case 'category':
			$order = 'conference.name ASC, church.name ASC';
			break;

		case 'popular':
		case 'newest':
		case 'oldest':
		default:
			$order = 'church.name DESC';
	}

	$text	= $db->Quote( '%'.$db->getEscaped( $text, true ).'%', false );
	$query	= 'SELECT church.name AS title, "" AS created, church.id AS id,'
	. ' CONCAT_WS( ", ", church.name, church.street, church.city, conference.name ) AS text,'
	. ' CONCAT_WS( " / ", '.$db->Quote($section).', conference.name ) AS section,'
	. ' "2" AS browsernav'
	. ' FROM #__churches AS church'
	. ' INNER JOIN #__conferences AS conference ON conference.id = church.conference_id'
	. ' WHERE ( church.name LIKE '.$text
	. ' OR church.street LIKE '.$text
	. ' OR church.street2 LIKE '.$text
	. ' OR church.city LIKE '.$text.' )'
	. ' GROUP BY church.id'
	. ' ORDER BY '. $order
	;
	$db->setQuery( $query, 0, $limit );
	$rows = $db->loadObjectList();

	foreach($rows as $key => $row) {
		$rows[$key]->href = 'index.php?option=com_directory&view=church&cid[]='.$row->id;
	}

	return $rows;
}
