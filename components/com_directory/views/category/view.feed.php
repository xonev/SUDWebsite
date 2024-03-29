<?php
/**
 * @version		$Id: view.feed.php 10381 2008-06-01 03:35:53Z pasamio $
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

jimport('joomla.application.component.view');

/**
 * @pacakge Joomla
 * @subpackage	Directory
 */
class ContactViewCategory extends JView
{
	function display()
	{
		global $mainframe;

		$db			=& JFactory::getDBO();
		$document	=& JFactory::getDocument();
		$document->link = JRoute::_('index.php?option=com_directory&view=category&catid='.JRequest::getVar('catid',null, '', 'int'));

		$limit 		= JRequest::getVar('limit', $mainframe->getCfg('feed_limit'), '', 'int');
		$limitstart = JRequest::getVar('limitstart', 0, '', 'int');
		$catid  	= JRequest::getVar('catid', 0, '', 'int');

		$where		= ' WHERE a.published = 1';

		if ( $catid ) {
			$where .= ' AND a.catid = '. (int) $catid;
		}

		$query = 'SELECT'
		. ' a.name AS title,'
		. ' CONCAT( a.con_position, \' - \', a.misc ) AS description,'
		. ' "" AS date,'
		. ' c.title AS category,'
		. ' CASE WHEN CHAR_LENGTH(a.alias) THEN CONCAT_WS(":", a.id, a.alias) ELSE a.id END as slug,'
		. ' CASE WHEN CHAR_LENGTH(c.alias) THEN CONCAT_WS(":", c.id, c.alias) ELSE c.id END as catslug'
		. ' FROM #__contact_details AS a'
		. ' LEFT JOIN #__directory_categories AS c ON c.id = a.catid'
		. $where
		. ' ORDER BY a.catid, a.ordering'
		;
		$db->setQuery( $query, 0, $limit );
		$rows = $db->loadObjectList();

		foreach ( $rows as $row )
		{
			// strip html from feed item title
			$title = $this->escape( $row->title );
			$title = html_entity_decode( $title );

			// url link to article
			$link = JRoute::_('index.php?option=com_directory&view=contact&id='. $row->slug .'&catid='.$row->catslug );

			// strip html from feed item description text
			$description = $row->description;
			$date = ( $row->date ? date( 'r', strtotime($row->date) ) : '' );

			// load individual item creator class
			$item = new JFeedItem();
			$item->title 		= $title;
			$item->link 		= $link;
			$item->description 	= $description;
			$item->date			= $date;
			$item->category   	= $row->category;

			// loads item info into rss array
			$document->addItem( $item );
		}
	}
}