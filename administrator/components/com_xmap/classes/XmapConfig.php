<?php
/**
 * $Id: XmapConfig.php 139 2008-04-05 18:51:03Z root $
 * $LastChangedDate: 2008-04-05 12:51:03 -0600 (sáb, 05 abr 2008) $
 * $LastChangedBy: root $
 * Xmap by Guillermo Vargas
 * a sitemap component for Joomla! CMS (http://www.joomla.org)
 * Author Website: http://joomla.vargas.co.cr
 * Project License: GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

/** Wraps all configuration functions for Xmap */

defined( '_JEXEC' ) or die( 'Direct Access to this location is not allowed.' );

require_once (JPATH_ADMINISTRATOR.DS.'components'.DS.'com_xmap'.DS.'classes'.DS.'XmapSitemap.php');
require_once (JPATH_ADMINISTRATOR.DS.'components'.DS.'com_xmap'.DS.'classes'.DS.'XmapPlugin.php');

class XmapConfig {
	var $version 			= '1.1';
	var $classname 			= 'sitemap';
	var $expand_category 	= 1;
	var $expand_section 	= 1;
	var $show_menutitle 	= 1;
	var $columns 			= 1;
	var $exlinks 			= 1;
	var $ext_image 			= 'img_grey.gif';
	var $exclmenus			= '';
	var $includelink		= 1;
	var $sitemap_default		= 1;
	var $exclude_css		= 0;
	var $exclude_xsl		= 0;

	function XmapConfig () {
		$version 			= '1.2';
		$classname 			= 'sitemap';
		$expand_category 	= 1;
		$expand_section 	= 1;
		$show_menutitle 	= 1;
		$columns 			= 1;
		$exlinks 			= 1;
		$ext_image 			= 'img_grey.gif';
		$exclmenus			= '';
		$includelink		= 1;
		$sitemap_default	= 1;
		$exclude_css	= 0;
		$exclude_xsl	= 0;

	}

	/** Return $menus as an associative array */
	function &getSitemaps() {
		$database = & JFactory::getDBO();

		$query = "SELECT id FROM #__xmap_sitemap";
		$database->setQuery($query);
		$ids = $database->loadResultArray();
		$sitemaps = array();
		foreach ($ids as $id ) {
			$sitemap = new XmapSitemap($database);
			$sitemap->load($id);
			$sitemaps[] = $sitemap;
		}
		return $sitemaps;

	}

	/** Create the settings table for Xmap and add initial default values */
	function create() {
		$database = & JFactory::getDBO();

		$fields = array();
		$fields[] = "`name` varchar(30) not null primary key";
		$fields[] = "`value` varchar(100)";


		$query = "CREATE TABLE #__xmap (". implode(', ', $fields) .")";
		$database->setQuery( $query );
		if( $database->query() === FALSE ) {
			echo _XMAP_ERR_NO_CREATE . "<br />\n";
			echo stripslashes($database->getErrorMsg());
			return false;
		}


		$fields = array();
		$fields[] = "`id` int not null primary key auto_increment";
		$fields[] = "`extension` varchar(100) not null";
		$fields[] = "`published` int(1) default 0";
		$fields[] = "`params` text";


		$query = "CREATE TABLE #__xmap_ext (". implode(', ', $fields) .")";
		$database->setQuery( $query );
		if( $database->query() === FALSE ) {
			echo _XMAP_ERR_NO_CREATE . "<br />\n";
			echo stripslashes($database->getErrorMsg());
			return false;
		}

		$extensions = array (
			//	name			published
			array(	'com_content',		1)
		);
		foreach ( $extensions as $ext ) {
			$extension = new XmapPlugin($database);
			$extension->extension = $ext[0];
			$extension->published = $ext[1];
			$xmlfile = $extension->getXmlPath();
			$extension->setParams($extension->loadDefaultsParams(true),'-1');
			$extension->store();
			$extension->restore(); //Load settings from backup
		}

		$vars = get_class_vars('XmapSitemap');
		$fields = '';
		foreach($vars as $name => $value) {
			if ($name[0]!=='_') {
				if ($name == 'id') {
					$fields[] = 'id INT NOT NULL PRIMARY KEY AUTO_INCREMENT';
				} else {
					switch( gettype( $value ) ) {
					case 'integer':
							$fields[] = "`$name` INTEGER NULL";
							break;
					case 'string':
							if( $name == 'menus')
									$fields[] = "`$name` TEXT NULL";
							else
									$fields[] = "`$name` VARCHAR(255) NULL";
							break;
					}
				}
			}
		}
		$query = "CREATE TABLE #__xmap_sitemap (". implode(', ', $fields) .")";
		$database->setQuery( $query );
		if( $database->query() === FALSE ) {
				echo _XMAP_ERR_NO_CREATE . "<br />\n";
				echo stripslashes($database->getErrorMsg());
				return false;
		}
		echo _XMAP_MSG_SET_DB_CREATED . "<br />\n";


		// Insert default Settings
		
		$sitemap = new XmapSitemap($database);
		$sitemap->save();

		$fields = array();
		$vars = get_class_vars('XmapConfig');
		foreach($vars as $name => $value) {
			if ($name == 'sitemap_default') {
				$value = $sitemap->id;
			}
			$query = "INSERT INTO #__xmap (`name`,`value`) values ('$name','$value')";
			$database->setQuery( $query );
			if( $database->query() === FALSE ) {
				echo _XMAP_ERR_NO_DEFAULT_SET . "<br />\n";
				echo stripslashes($database->getErrorMsg());
				return false;
			}
		}

		echo _XMAP_MSG_SET_DEF_INSERT . "<br />\n";
		return true;
	}

	/** Create a backup of the settings */
	function backup() {
		$database = & JFactory::getDBO();
		$query = "DROP TABLE IF EXISTS #__xmap_backup";				// remove old backup
		$database->setQuery( $query );
		if( $database->query() === FALSE ) {
			echo _XMAP_ERR_NO_PREV_BU . "<br />\n";
			echo stripslashes($database->getErrorMsg());
		}

		$query = "DROP TABLE IF EXISTS #__xmap_ext_backup";			// remove old backup
		$database->setQuery( $query );
		if( $database->query() === FALSE ) {
			echo _XMAP_ERR_NO_PREV_BU . "<br />\n";
			echo stripslashes($database->getErrorMsg());
		}

		$query = "DROP TABLE IF EXISTS #__xmap_sitemap_backup";			// remove old backup
		$database->setQuery( $query );
		if( $database->query() === FALSE ) {
			echo _XMAP_ERR_NO_PREV_BU . "<br />\n";
			echo stripslashes($database->getErrorMsg());
		}

		$querys[] = "CREATE TABLE #__xmap_backup SELECT * FROM #__xmap";		// backup current settings
		$querys[] = "CREATE TABLE #__xmap_sitemap_backup SELECT * FROM #__xmap_sitemap";	// backup current settings
		$querys[] = "CREATE TABLE #__xmap_ext_backup SELECT * FROM #__xmap_ext ";		// backup current extensions settings
		$querys[] = "DELETE from #__xmap_ext_backup where extension like '%.bak' and extension in (select concat(extension,'.bak') FROM #__xmap_ext where extension not like '%.bak')";		// remove old extensions backups
		$querys[] = "UPDATE #__xmap_ext_backup SET extension=concat(extension,'.bak') where extension not like '%.bak'";		// backup current settings
		foreach ($querys as $query) {
			$database->setQuery( $query );
			if( $database->query() === FALSE ) {
				echo _XMAP_ERR_NO_BACKUP . "<br />\n";
				echo stripslashes($database->getErrorMsg());
				return false;
			}
		}


		return true;
	}

	/** Restore backup settings */
	function restore() {
		global $mainframe;
		$database = & JFactory::getDBO();

		$query = "show table status like '".$mainframe->getCfg('dbprefix')."xmap_backup'";
		$database->setQuery($query);
		if (!$database->query()) {
			echo $database->getErrorMsg();
		}
		$exists = ($database->getNumRows() > 0);
		if (!$exists)
			return false;

		$query = "SELECT * FROM #__xmap_backup";	// restore backup settings
		$database->setQuery( $query );

		if ($result = $database->loadAssocList('name') ) {
			$backup= new stdClass;
			foreach ($result as $name => $row) {
				if ($name) {
					$backup->$name = $row['value'];
				}
			}
		} else {
			return false;
		}

		if( isset( $this ) && is_object( $this ) ) {
			$config = &$this;
		} else {
			$config = new XmapConfig;
		}

		$vars = get_class_vars('XmapConfig');			// assign current settings
		foreach( $vars as $var => $value ) {
			if( isset($backup->$var) )
				$config->$var = $backup->$var;
		}

		$config->save();					// save current settings

		$query = "DELETE FROM `#__xmap_sitemap`";
		$database->setQuery($query);
		$database->query();

		$query = "SELECT * FROM #__xmap_sitemap_backup";	// restore backup settings
		$database->setQuery( $query );
		if ($result = $database->loadAssocList() ) {
			foreach ( $result as $values ) {
				$sitemap= new XmapSitemap($database);
				$sitemap->bind($values);
				$sitemap->save(true);
			}
		} else {
			return false;
		}

		$query = "show table status like '".$mainframe->getCfg('dbprefix')."xmap_ext_backup'";
		$database->setQuery($query);
		if (!$database->query()) {
			echo $database->getErrorMsg();
		}
		$exists = ($database->getNumRows() > 0);
		if (!$exists)
			return true;

		$query = "SELECT * FROM #__xmap_ext_backup";	// restore backup settings
		$database->setQuery( $query );

		if ($result = $database->loadAssocList('extension') ) {
			foreach ($result as $name => $row) {
				if ($name && strpos($name,'.bak')) {
					$extension = new XmapPlugin($database);
					$extension->bind($row);
					$extension->id=NULL;
					$extension->store();
				}
			}
		} else {
			return false;
		}

		return true;
	}

	/** Remove the settings table */
	function remove() {
		$database = & JFactory::getDBO();
		$querys[] = "DROP TABLE IF EXISTS #__xmap";
		$querys[] = "DROP TABLE IF EXISTS #__xmap_sitemap";
		$querys[] = "DROP TABLE IF EXISTS #__xmap_ext";
		foreach ($querys as $query) {
			$database->setQuery( $query );
			if( $database->query() === FALSE ) {
				echo _XMAP_ERR_NO_DROP_DB . "<br />\n";
				echo stripslashes($database->getErrorMsg());
				return false;
			}
		}
		echo  "Xmap's tables have been saved!<br />\n";

	}

	/** Load settings from the database into this instance */
	function load() {
		$database = & JFactory::getDBO();

		$query = "SELECT * FROM #__xmap";
		$database->setQuery( $query );
		if ($result = $database->loadAssocList('name') ) {
			foreach ($result as $name => $row) {
				$this->$name = $row['value'];
			}
			return true;				// defaults are still set, though
		}
		$this->_sitemaps = array();
		return false;
	}

	/** Save current settings to the database */
	function save() {
		$database = & JFactory::getDBO();

		$vars = get_object_vars( $this );
		$query = "DELETE FROM `#__xmap`";
		$database->setQuery( $query );
		$database->query();
		foreach($vars as $name => $value) {
			if ( substr($name,0,1) !== '_' ) {
				$query = "INSERT INTO #__xmap (`name`,`value`) values ('$name','$value')";
				$database->setQuery( $query );
				if ( $database->query() === FALSE ) {
					return false;
				}
			}
		}

		return true;
	}
	
	/** Debug output of current settings */
	function dump() {
		$vars = get_object_vars( $this );
		echo '<pre style="text-align:left">';
		foreach( $vars as $name => $value ) {
			echo $name.': '.$value."\n";
		}
		echo '</pre>';
	}
	
}
