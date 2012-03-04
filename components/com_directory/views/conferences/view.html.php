<?php
/**
 * @version $Id: view.html.php 177 2009-03-09 08:13:03Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for showing a list of conferences.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryViewConferences extends JView
{
	function display( $tpl = null )
	{
		$conferenceList = $this->get( 'Conferences' );
		$this->assignRef( 'conferences', $conferenceList );
		parent::display( $tpl );
	}
}
