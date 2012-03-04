<?php
/**
* @version		helper.php 03-03-2009
* @package		JCE Admin Component
* @subpackage	Plugins
* @copyright	Copyright (C) 2006 - 2009 Ryan Demmer. All rights reserved.
* @license		GNU/GPL
* JCE is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
*/
class JCEHelper {	
	function dbList( $list ){
		if( is_array( $list ) ){
			$ret = array();
			foreach( $list as $item ){
				$ret[] = "'". $item ."'";
			}
			return implode( ',', $ret );
		}
		return $list;
	}
	// Update from 1.5.0 to 1.5.1
	function checkDB(){
		// Check for Readmore plugin indicates 1.5.0
		$db	=& JFactory::getDBO();

		$query = 'SELECT count(id)'
		. ' FROM #__jce_plugins'
		. ' WHERE name = '. $db->Quote( 'readmore' )
		;
		
		$db->setQuery( $query );
		return $db->loadResult() ? false : true;
	}
	function checkEditorInstall(){
		$db	=& JFactory::getDBO();
		
		$query = 'SELECT id'
		. ' FROM #__plugins'
		. ' WHERE element = '. $db->Quote( 'jce' )
		. ' AND folder = '. $db->Quote( 'editors' )
		;
		$db->setQuery( $query );	
		return $db->loadResult();
	}
	function checkEditor(){
		$db	=& JFactory::getDBO();
		
		$query = 'SELECT published'
		. ' FROM #__plugins'
		. ' WHERE element = '. $db->Quote( 'jce' )
		. ' AND folder = '. $db->Quote( 'editors' )
		;
		$db->setQuery( $query );	
		return $db->loadResult();
	}
	function checkEditorPath(){
		$path = JPATH_PLUGINS .DS. 'editors';
		if( file_exists( $path .DS. 'jce.php' ) && file_exists( $path .DS. 'jce.xml' ) && is_dir( $path .DS. 'jce' ) ){
			return true;
		}
		return false;
	}
	function checkPlugins(){
		$db =& JFactory::getDBO();
		$query = 'SELECT COUNT(id)'
		. ' FROM #__jce_plugins'
		;
		$db->setQuery( $query );
		
		return $db->loadResult() ? true : false;
	}
	function checkGroups(){
		$db =& JFactory::getDBO();
		$query = 'SELECT id'
		. ' FROM #__jce_groups'
		;
		$db->setQuery( $query );
		$result = $db->loadResult();
		
		return $result ? true : false;
	}
	function updateDB( $install = false ){
		global $mainframe;
		$db =& JFactory::getDBO();
		
		JTable::addIncludePath( JPATH_ADMINISTRATOR .DS. 'components' .DS. 'com_jce' .DS. 'plugins' );
		JTable::addIncludePath( JPATH_ADMINISTRATOR .DS. 'components' .DS. 'com_jce' .DS. 'groups' );
		
		$buttons 	= JCEHelper::getButtons();
		$remove 	= array();
		
		$query = 'DELETE FROM #__jce_plugins WHERE iscore = 1 AND name NOT IN ('. JCEHelper::dbList( array_keys( $buttons ) ) .')';
		$db->setQuery( $query );		
		$db->query();
				
		$query = 'SELECT name FROM #__jce_plugins WHERE iscore = 1';
		$db->setQuery( $query );		
		$current = $db->loadResultArray();
		
		if( count( array_keys( $buttons ) ) > count( $current ) ){
			$diff = array_diff( array_keys( $buttons ), $current );
			
			// Get list from editor if installed
			$path = JPATH_PLUGINS .DS. 'editors' .DS. 'jce' .DS. 'tiny_mce' .DS. 'plugins';
			if( is_dir( $path ) ){
				jimport( 'joomla.filesystem.folder' );
				$plugins = JFolder::folders( $path );
			}else{
				$plugins = array('contextmenu','directionality','emotions','fullscreen','paste','preview','table','print','searchreplace','style','layer','nonbreaking','visualchars','xhtmlxtras','imgmanager','advlink','spellchecker','help','browser','inlinepopups','media','safari','advcode','article','code','media');
			}
			// Add plugins/commands
			foreach( $buttons as $k => $v ){
				if( in_array( $k, $diff ) ){					
					$row 			=& JTable::getInstance('plugin', 'JCETable');
									
					$row->name 		= $k;
					$row->published = 1;
					$row->iscore 	= 1;
					$row->editable 	= 0;
					$row->type		= in_array( $k, $plugins ) ? 'plugin' : 'command';
							
					$row->bind( $v );
					
					// Set Icon and Layout
					if( $row->row ){
						if( !isset( $row->icon ) ){
							$row->icon = $row->name;
						}
						if( !isset( $row->layout ) ){
							$row->layout = $row->name;
						}					
						$row->ordering = 1;
					}
					
					if( !$row->store() ){
						$mainframe->enqueueMessage( JText::_('Unable to add '. $row->title .' '. $row->type .' to Plugins table'), 'error' );
					}else{
						if( $row->type == 'plugin' ){				
							$group =& JTable::getInstance('groups', 'JCETable');
							
							$query = 'SELECT id'
							. ' FROM #__jce_groups'
							. ' WHERE name = '. $db->Quote('Default')
							;
							$db->setQuery( $query );
							$id = $db->loadResult();
							
							$group->load( $id );				
							// Add to plugins list
							$group->plugins = $group->plugins . ',' . $row->id;
							// Add to last row if plugin has a layout icon
							if( $row->layout ){
								$group->rows = $group->rows . ',' . $row->id;
							}				
							if( !$group->store() ) {
								$mainframe->enqueueMessage( JText::_('Unable to add '. $row->title .' to Default group'), 'error' );
							}
						}
						$mainframe->enqueueMessage( JText::_( $row->title .' '. $row->type . ' added to Plugins table' ) ); 
					}
				}
			}				
		}
		
		// Add Admin Menu options
		$query = "UPDATE #__components SET `admin_menu_img` = '../administrator/components/com_jce/img/logo.png'"
		. " WHERE link = " . $db->Quote('option=com_jce')
		;
		
		$db->setQuery( $query );
		
		if( !$db->query() ){
			$mainframe->enqueueMessage( JText::_('Unable add Administration menu image!'), 'error' );
		}else{
			$mainframe->enqueueMessage( JText::_('Administration menu image added successfully') );
		}
		if( !$install ){	
			$mainframe->redirect( 'index.php?option=com_jce&redirected=1' );
		}
	} 
	function getButtons(){		
		$buttons = array(
			'contextmenu'	=>	array(
				'title'	=>	'Context Menu',
				'row'	=>	0
			),
			'browser'	=>	array(
				'title'	=>	'File Browser',
				'row'	=>	0,
				'editable'	=>	1
			),
			'inlinepopups'	=>	array(
				'title'	=>	'Inline Popups',
				'row'	=>	0
			),
			'media'	=>	array(
				'title'	=>	'Media Support',
				'row'	=>	0,
				'editable'	=>	1
			),
			'safari'	=>	array(
				'title'	=>	'Safari Browser Support',
				'row'	=>	0
			),
			'help'	=>	array(
				'title'	=>	'Help',
				'row'	=>	1
			),
			'newdocument'	=>	array(
				'title'	=>	'New Document',
				'row'	=>	1
			),
			'bold'	=>	array(
				'title'	=>	'Bold',
				'row'	=>	1
			),
			'italic'	=>	array(
				'title'	=>	'Italic',
				'row'	=>	1
			),
			'underline'	=>	array(
				'title'	=>	'Underline',
				'row'	=>	1
			),
			'fontselect'	=>	array(
				'title'	=>	'Font Select',
				'row'	=>	1
			),
			'fontsizeselect'	=>	array(
				'title'	=>	'Font Size Select',
				'row'	=>	1
			),
			'styleselect'	=>	array(
				'title'	=>	'Style Select',
				'row'	=>	1
			),
			'strikethrough'	=>	array(
				'title'	=>	'StrikeThrough',
				'row'	=>	1
			),
			'full'	=>	array(
				'title'	=>	'Justify Full',
				'row'	=>	1,
				'icon'	=>	'justifyfull',
				'layout'=>	'justifyfull'
			),
			'center'	=>	array(
				'title'	=>	'Justify Center',
				'row'	=>	1,
				'icon'	=>	'justifycenter',
				'layout'=>	'justifycenter'
			),
			'left'	=>	array(
				'title'	=>	'Justify Left',
				'row'	=>	1,
				'icon'	=>	'justifyleft',
				'layout'=>	'justifyleft'
			),
			'right'	=>	array(
				'title'	=>	'Justify Right',
				'row'	=>	1,
				'icon'	=>	'justifyright',
				'layout'=>	'justifyright'
			),
			'formatselect'	=>	array(
				'title'	=>	'Format Select',
				'row'	=>	1
			),
			'paste'	=>	array(
				'title'	=>	'Paste',
				'icon'	=>	'pasteword,pastetext',
				'row'	=>	2,
				'editable'	=>	1
			),
			'searchreplace'	=>	array(
				'title'	=>	'Search Replace',
				'icon'	=>	'search,replace',
				'row'	=>	2
			),
			'forecolor'	=>	array(
				'title'	=>	'Font ForeColour',
				'row'	=>	2
			),
			'backcolor'	=>	array(
				'title'	=>	'Font BackColour',
				'row'	=>	2
			),
			'unlink'	=>	array(
				'title'	=>	'Unlink',
				'row'	=>	2
			),
			'indent'	=>	array(
				'title'	=>	'Indent',
				'row'	=>	2
			),
			'outdent'	=>	array(
				'title'	=>	'Outdent',
				'row'	=>	2
			),
			'undo'	=>	array(
				'title'	=>	'Undo',
				'row'	=>	2
			),
			'redo'	=>	array(
				'title'	=>	'Redo',
				'row'	=>	2
			),
			'html'	=>	array(
				'title'	=>	'HTML',
				'icon'	=>	'code',
				'layout'=>	'code',
				'row'	=>	2
			),
			'numlist'	=>	array(
				'title'	=>	'Numbered List',
				'row'	=>	2
			),
			'bullist'	=>	array(
				'title'	=>	'Bullet List',
				'row'	=>	2
			),
			'clipboard'	=>	array(
				'title'	=>	'Clipboard Actions',
				'icon'	=>	'cut,copy,paste',
				'row'	=>	2
			),
			'anchor'	=>	array(
				'title'	=>	'Anchor',
				'row'	=>	2
			),
			'image'	=>	array(
				'title'	=>	'Image',
				'row'	=>	2
			),
			'link'	=>	array(
				'title'	=>	'Link',
				'row'	=>	2
			),
			'cleanup'	=>	array(
				'title'	=>	'Code Cleanup',
				'row'	=>	2
			),
			'directionality'	=>	array(
				'title'	=>	'Directionality',
				'icon'	=>	'ltr,rtl',
				'row'	=>	3
			),
			'emotions'	=>	array(
				'title'	=>	'Emotions',
				'row'	=>	3
			),
			'fullscreen'	=>	array(
				'title'	=>	'Fullscreen',
				'row'	=>	3
			),
			'preview'	=>	array(
				'title'	=>	'Preview',
				'row'	=>	3
			),
			'table'	=>	array(
				'title'	=>	'Tables',
				'icon'	=>	'tablecontrols',
				'layout'=>	'buttons',
				'row'	=>	3
			),
			'print'	=>	array(
				'title'	=>	'Print',
				'row'	=>	3
			),
			'hr'	=>	array(
				'title'	=>	'Horizontal Rule',
				'row'	=>	3
			),
			'sub'	=>	array(
				'title'	=>	'Subscript',
				'row'	=>	3
			),
			'sup'	=>	array(
				'title'	=>	'Superscript',
				'row'	=>	3
			),
			'visualaid'	=>	array(
				'title'	=>	'Visual Aid',
				'row'	=>	3
			),
			'charmap'	=>	array(
				'title'	=>	'Character Map',
				'row'	=>	3
			),
			'removeformat'	=>	array(
				'title'	=>	'Remove Format',
				'row'	=>	3
			),
			'style'	=>	array(
				'title'	=>	'Styles',
				'icon'	=>	'styleprops',
				'row'	=>	4
			),
			'nonbreaking'	=>	array(
				'title'	=>	'Non-Breaking',
				'row'	=>	4
			),
			'visualchars'	=>	array(
				'title'	=>	'Visual Characters',
				'row'	=>	4
			),
			'xhtmlxtras'	=>	array(
				'title'	=>	'XHTML Xtras',
				'icon'	=>	'cite,abbr,acronym,del,ins,attribs',
				'row'	=>	4
			),
			'imgmanager'	=>	array(
				'title'	=>	'Image Manager',
				'row'	=>	4,
				'editable'	=>	1
			),
			'advlink'	=>	array(
				'title'	=>	'Advanced Link',
				'row'	=>	4,
				'editable'	=>	1
			),
			'spellchecker'	=>	array(
				'title'	=>	'Spell Checker',
				'row'	=>	4,
				'editable'	=>	1
			),
			'layer'	=>	array(
				'title'	=>	'Layers',
				'icon'	=>	'insertlayer,moveforward,movebackward,absolute',
				'row'	=>	4
			),
			'advcode'	=>	array(
				'title'	=>	'Advanced Code Editor',
				'row'	=>	4
			),
			'article'	=>	array(
				'title'	=>	'Article Breaks',
				'icon'	=>	'readmore,pagebreak',
				'row'	=>	4
			)
		);
		return $buttons;
	}
	function createPluginsTable(){
		global $mainframe;
		$db =& JFactory::getDBO();
		
		$query = "CREATE TABLE IF NOT EXISTS `#__jce_plugins` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`title` varchar(255) NOT NULL,
		`name` varchar(255) NOT NULL,
		`type` varchar(255) NOT NULL,
		`icon` varchar(255) NOT NULL,
		`layout` varchar(255) NOT NULL,
		`row` int(11) NOT NULL,
		`ordering` int(11) NOT NULL,
		`published` tinyint(3) NOT NULL,
	 	`editable` tinyint(3) NOT NULL,
		`elements` varchar(255) NOT NULL,
		`params` text NOT NULL,
		`iscore` tinyint(3) NOT NULL,
		`checked_out` int(11) NOT NULL,
		`checked_out_time` datetime NOT NULL,
		PRIMARY KEY (`id`),
		UNIQUE KEY `plugin` (`name`)
		);";
		$db->setQuery( $query );
		
		if( !$db->query() ){
			$mainframe->enqueueMessage( JText::_('Unable to create Plugins Table!'), 'error' );
			return false;
		}else{
			return true;
		}
	}
	function createExtensionsTable(){
		global $mainframe;
		$db =& JFactory::getDBO();
		
		// Extensions
		$query = "CREATE TABLE IF NOT EXISTS `#__jce_extensions` (
		`id` int(11) NOT NULL auto_increment,
		`pid` int(11) NOT NULL,
		`name` varchar(100) NOT NULL,
		`extension` varchar(255) NOT NULL,
		`folder` varchar(255) NOT NULL,
		`published` tinyint(3) NOT NULL,
		PRIMARY KEY  (`id`)
		)";
		$db->setQuery( $query );
		
		if( !$db->query() ){
			$mainframe->enqueueMessage( JText::_('Unable to create Extensions Table!'), 'error' );
			return false;
		}else{
			return true;
		}
	}
	function createGroupsTable(){
		global $mainframe;
		$db =& JFactory::getDBO();
		
		$query = "CREATE TABLE IF NOT EXISTS `#__jce_groups` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(255) NOT NULL,
		`description` varchar(255) NOT NULL,
		`users` text NOT NULL,
		`types` varchar(255) NOT NULL,
		`components` text NOT NULL,
		`rows` text NOT NULL,
		`plugins` varchar(255) NOT NULL,
		`published` tinyint(3) NOT NULL,
		`ordering` int(11) NOT NULL,
		`checked_out` tinyint(3) NOT NULL,
		`checked_out_time` datetime NOT NULL,
		`params` text NOT NULL,
		PRIMARY KEY (`id`)
		);";
		$db->setQuery( $query );
		
		if( !$db->query() ){
			$mainframe->enqueueMessage( JText::_('Unable to create Groups Table!'), 'error' );
			return false;
		}else{
			return true;
		}
	}
	function installGroups( $install = false ){
		global $mainframe;
		$db =& JFactory::getDBO();
		
		JTable::addIncludePath( JPATH_ADMINISTRATOR .DS. 'components' .DS. 'com_jce' .DS. 'groups' );

		if( JCEHelper::createGroupsTable() ){
			$mainframe->enqueueMessage( JText::_('Groups Table created successfully.') );
			
			$query = 'SELECT count(id) FROM #__jce_groups';
			$db->setQuery( $query );
			
			$groups = array(
				'Default'	=>	false,
				'Front End'	=>	false
			);
			
			// No Groups table data
			if( !$db->loadResult() ){
				// Exclude these. Will be removed in 1.6
				$exclude = array( 'layer', 'image', 'link', 'html' );
				
				$query = 'SELECT id FROM #__jce_plugins'
				. ' WHERE type = '. $db->Quote('plugin')
				. ' AND name NOT IN ('. JCEHelper::dbList( $exclude ) .')'
				. ' AND published = 1';
				$db->setQuery( $query );
				$plugins = $db->loadResultArray();

				$rows = array();
				
				$query = 'SELECT DISTINCT row FROM #__jce_plugins WHERE row > 0';
				$db->setQuery( $query );
				$num = $db->loadResultArray();
				
				foreach( $num as $n ){
					$query = 'SELECT id FROM #__jce_plugins WHERE row = '. $n .' AND name NOT IN ('. JCEHelper::dbList( $exclude ) .')';
					$db->setQuery( $query );				
					$rows[] = implode( ',', $db->loadResultArray() );
				}
				
				$row =& JTable::getInstance('groups', 'JCETable');
				
				$row->name 			= 'Default';
				$row->description 	= 'Default group for all users with edit access';
				$row->types			= '19,20,21,23,24,25';
				$row->rows			= implode( ';', $rows );
				$row->plugins		= implode( ',', $plugins );
				$row->published		= 1;
				$row->ordering		= 1;
				
				$groups['Default'] 	= $row->store();
				
				// TODO : Move this out to an xml file or something
				
				$row =& JTable::getInstance('groups', 'JCETable');
				
				$tmpl = array(
					'help,newdocument,undo,redo,bold,italic,underline,strikethrough,left,center,full,right,styleselect,formatselect',
					'sub,sup,numlist,bullist,indent,outdent,hr,charmap,visualchars,nonbreaking,searchreplace,clipboard,paste,removeformat,cleanup',
					'fullscreen,preview,print,visualaid,style,xhtmlxtras,anchor,unlink,advlink,imgmanager,spellchecker,advcode,article,contextmenu,safari,inlinepopups'
				);
				
				$plugins 	= array();
				$rows 		= array();
				
				foreach( $tmpl as $item ){
					$query = 'SELECT id FROM #__jce_plugins WHERE name IN ('. JCEHelper::dbList( explode( ',', $item ) ) .') AND row > 0';
					$db->setQuery( $query );
								
					$rows[] = implode( ',', $db->loadResultArray() );
					
					$query = 'SELECT id FROM #__jce_plugins WHERE name IN ('. JCEHelper::dbList( explode( ',', $item ) ) .') AND type = '. $db->Quote( 'plugin' );
					$db->setQuery( $query );				
					$plugins[] = implode( ',', $db->loadResultArray() );
				}
				
				$row->name 			= 'Front End';
				$row->description 	= 'Sample Group for Authors, Editors, Publishers';
				$row->types			= '19,20,21';
				$row->rows			= implode( ';', $rows );
				$row->plugins		= implode( ',', $plugins );
				$row->published		= 0;
				$row->ordering		= 2;
				
				$groups['Front End'] = $row->store();
				
				// Print message
				foreach( $groups as $k => $v ){
					if( $v ){
						$mainframe->enqueueMessage( JText::_($k .' Groups Table updated successfully.' ) );
					}else{
						$mainframe->enqueueMessage( JText::_('Unable to insert '. $k .' Groups Table data!'), 'error' );
					}
				}
			}
		}
		if( !$install ){	
			$mainframe->redirect( 'index.php?option=com_jce&redirected=1' );
		}
	}
	function installPlugins( $install = false ){
		global $mainframe;
		$db =& JFactory::getDBO();
		
		JTable::addIncludePath( JPATH_ADMINISTRATOR .DS. 'components' .DS. 'com_jce' .DS. 'plugins' );
		
		if( JCEHelper::createPluginsTable() ){
			$mainframe->enqueueMessage( JText::_('Plugins table created successfully.') );

			$query = 'SELECT count(id) FROM #__jce_plugins';
			$db->setQuery( $query );
			
			if( !$db->loadResult() ){
				// Load table class 
				require_once( dirname( __FILE__ ) .DS. 'plugins' .DS. 'plugin.php' );
				
				// Get list from editor if installed
				$path = JPATH_PLUGINS .DS. 'editors' .DS. 'jce' .DS. 'tiny_mce' .DS. 'plugins';
				if( is_dir( $path ) ){
					jimport( 'joomla.filesystem.folder' );
					$plugins = JFolder::folders( $path );
				}else{
					$plugins = array('contextmenu','directionality','emotions','fullscreen','paste','preview','table','print','searchreplace','style','layer','nonbreaking','visualchars','xhtmlxtras','imgmanager','advlink','spellchecker','help','browser','inlinepopups','media','safari','advcode','article','code','media');
				}
				$errors = array();
				
				$r = 1;
				$x = 0;
				
				$row =& JTable::getInstance('plugin', 'JCETable');
				
				$query = 'INSERT INTO #__jce_plugins (';
				
				foreach( $row as $k	=> $v ){
					if( $k{0} != '_' ){
						$query .= '`'. $k . '`,';
					}
				}
				$query = substr( $query, 0, -1 ) . ') VALUES ';
				// Get the buttons array
				$buttons = JCEHelper::getButtons();
					
				foreach( $buttons as $k => $v ){					
					$row 			=& JTable::getInstance('plugin', 'JCETable');
							
					$row->name 		= $k;
					$row->published = 1;
					$row->iscore 	= 1;
					$row->editable 	= 0;
					$row->type		= in_array( $k, $plugins ) ? 'plugin' : 'command';
					
					$row->bind( $v );

					// Set Icon and Layout
					if( $row->row ){
						if( !isset( $row->icon ) ){
							$row->icon = $row->name;
						}
						if( !isset( $row->layout ) ){
							$row->layout = $row->name;
						}					
						// Set ordering
						if( $row->row == $r ){
							$x++;
						}else{
							$r = $row->row;
							$x = 1;
						}
						$row->ordering = $x;
					}
					$query .= '(';
					foreach( $row as $k	=>	$v ){
						if( $k{0} != '_' ){
							$query .= "'". $v . "',";
						}
					}
					$query = substr( $query, 0, -1 ) . '),';	
				}
				$query = substr( $query, 0, -1 );
				
				$db->setQuery( $query );
				if( !$db->query() ){
					$mainframe->enqueueMessage( JText::_( 'Unable to insert plugin table values'), 'error' );
				}
			}
		}
		
		if( JCEHelper::createExtensionsTable() ){		
			$mainframe->enqueueMessage( JText::_('Plugin Extensions Table created successfully.') );
			// Check for JoomlaLinks	
			$query = 'SELECT id FROM #__jce_extensions WHERE extension = '. $db->Quote('joomlalinks');
			$db->setQuery( $query );
			// JoomlaLinks is not installed
			if( !$db->loadResult() ){		
				// Get AdvLink id
				$query = 'SELECT id FROM #__jce_plugins WHERE name = '. $db->Quote('advlink');
				$db->setQuery( $query );
				$id = $db->loadResult();
				// If Advlink installed
				if( $id ){
					$row 			=& JTable::getInstance('extension', 'JCETable');
					
					$row->pid 		= $id;
					$row->name 		= 'Joomla Links for Advanced Link';
					$row->extension = 'joomlalinks';
					$row->folder 	= 'links';
					$row->published = 1;
					
					if( $row->store() ){
						$mainframe->enqueueMessage( JText::_('Extensions table updated successfully.') );					
					}else{
						$mainframe->enqueueMessage( JText::_('Unable to insert Extensions Table data!'), 'error' );
					}
				}
			}
		}

		if( !$install ){	
			$mainframe->redirect( 'index.php?option=com_jce&redirected=1' );
		}
	}
	function installEditor(){
		global $mainframe;
		$path = JPATH_PLUGINS .DS. 'editors';
		if( file_exists( $path .DS. 'jce.php' ) && file_exists( $path .DS. 'jce.xml' ) ){	
			// Sourced from various Joomla! core files including the installer plugin adapter			
			$xml =& JFactory::getXMLParser('Simple');
			$name = 'JCE Editor 1.5.x';
					
			if( $xml->loadFile( $path .DS. 'jce.xml' ) ){
				$root =& $xml->document;	
				// Get the element of the tag names
				$name = $root->getElementByPath('name');
				$name = JFilterInput::clean($name->data(), 'string');
			}
			
			$row =& JTable::getInstance('plugin');
			$row->name 		= $name;
			$row->ordering 	= 0;
			$row->folder 	= 'editors';
			$row->iscore 	= 0;
			$row->access 	= 0;
			$row->published = 1;
			$row->client_id = 0;
			$row->element 	= 'jce';
			if (!$row->store()) {
			// Install failed, roll back changes
				$mainframe->redirect( 'index.php', JText::_('Plugin').' '.JText::_('Install').': '.$db->stderr(true) );
				return false;
			}
		}else{
			$mainframe->redirect( 'index.php', JText::_('Plugin files missing') );
			return false;
		}
		$mainframe->redirect( 'index.php?option=com_jce', JText::_('Editor successfully installed') );	
	}	
	function getOrderArray( $input, $listname, $itemKeyName = 'element', $orderKeyName = 'order' ) {
		parse_str( $input, $inputArray );
		$inputArray = $inputArray[$listname];
		$orderArray = array();
		for( $i=0; $i<count( $inputArray ); $i++ ) {
			$orderArray[] = array( $itemKeyName => $inputArray[$i], $orderKeyName => $i +1 );
		}
		return $orderArray;
	}
	function getAccessName( $id ){
		$db =& JFactory::getDBO();
		// get list of Groups for dropdown filter
		$query = 'SELECT name'
		. ' FROM #__core_acl_aro_groups'
		. ' WHERE id = '. $id
		. ' AND name != "ROOT"'
		. ' AND name != "USERS"'
		;
		$db->setQuery( $query );
		return $db->loadResult();
	}
	function accessList( $name, $access='', $size=1, $extra ){
		$db =& JFactory::getDBO();
		// get list of Groups for dropdown filter
		$query = 'SELECT id AS value, name AS text'
		. ' FROM #__core_acl_aro_groups'
		. ' WHERE id NOT IN (28,29,30)'
		;
		$db->setQuery( $query );
		$types[] = JHTML::_('select.option',  '0', '- '. JText::_( 'Select Access' ) .' -' );
		$i = '-';
		foreach( $db->loadObjectList() as $obj )
		{
			$types[] = JHTML::_('select.option', $obj->value, $i . JText::_( $obj->text ) );
			$i .= '-';
		}
		return JHTML::_('select.genericlist', $types, $name, 'class="inputbox" size="'. $size .'"'. $extra, 'value', 'text', $access );
	}
	function quickiconButton( $link, $image, $text, $disabled=false ){
		global $mainframe;
		$lang		=& JFactory::getLanguage();
		$template	= $mainframe->getTemplate();
		
		if( $disabled ){
			$link = '#';
		}				
		?>
		<div style="float:<?php echo ($lang->isRTL()) ? 'right' : 'left'; ?>;">
			<div class="icon">
				<a href="<?php echo $link; ?>">
					<?php echo JHTML::_('image.site',  $image, '/templates/'. $template .'/images/header/', NULL, NULL, $text ); ?>
					<span><?php echo $text; ?></span>
				</a>
			</div>
		</div>
        <?php
	}
	function getLanguage(){
		$language =& JFactory::getLanguage();
		$tag = $language->getTag();
		if( file_exists( JPATH_SITE .DS. 'language' .DS. $tag .DS. $tag .'.com_jce.xml' ) ){
			return substr( $tag, 0, strpos( $tag, '-' ) );
		}
		return 'en';
	}  
}
class jceToolbarHelper extends JToolbarHelper {
	function access( $alt = 'Plugin Access' ){
		$bar = & JToolBar::getInstance('toolbar');
		$bar->appendButton( 'Popup', 'lock', $alt, "index.php?option=com_jce&tmpl=component&type=plugin&task=access_popup", 400, 150 );
	}
	function popup( $alt, $icon, $type, $task, $width=750, $height=400 ){		
		$bar = & JToolBar::getInstance('toolbar');
		$bar->appendButton( 'Popup', $icon, $alt, "index.php?option=com_jce&tmpl=component&type=".$type."&task=".$task, $width, $height );
	}
	function config( $alt = 'Editor Config' ){
		$bar = & JToolBar::getInstance('toolbar');
		$bar->appendButton( 'Popup', 'config', $alt, "index.php?option=com_jce&tmpl=component&type=config&task=view", 700, 560 );
	}
	function help( $type, $alt='Help' ){
		jimport('joomla.plugin.helper');
		$plugin = JPluginHelper::getPlugin( 'editors', 'jce' );
		
		$url = 'http://www.joomlacontenteditor.net/index.php?option=com_content&tmpl=component&view=article&task=findkey';
				
		if( isset( $plugin->params ) ){
        	$params = new JParameter( $plugin->params );
			$url = $params->get( 'help', $url );
		}		
		$bar = & JToolBar::getInstance('toolbar');
		$bar->appendButton( 'Popup', 'help', $alt, $url. '&lang=' .JCEHelper::getLanguage(). '&keyref=admin.' .$type. '.view', 700, 560 );
	}
}
?>