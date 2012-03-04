<?php
/**
 * The view for a church
 * @version $Id: view.html.php 181 2009-03-10 09:12:16Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for a church
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryViewChurch extends JView
{
	/**
	 * Displays the template.
	 * @access public
	 */
	function display( $tpl = null )
	{
		$church = $this->get( 'Church' );

		//Add breadcrumb
		$conference_id = JRequest::getInt( 'conference_id', 0 );
		$mainframe =& JApplication::getInstance( 'site' );
		$breadcrumbs =& $mainframe->getPathway();

		//Add a breadcrumb for the conference if there was a conference selected
		if ( $conference_id ) {
			$breadcrumbs->addItem(
				$church->conference,
				'index.php?option=com_directory&view=conference&cid[]=' . $conference_id
			);
		}
		else {
			$breadcrumbs->addItem(
				JText::_( 'All Churches' ),
				'index.php?option=com_directory&view=conference&cid[]=0'
			);
		}

		$breadcrumbs->addItem(
			$church->name,
			'index.php?option=com_directory&view=church&cid[]=' . $church->id
		);

		$this->assignRef( 'church', $church );
		parent::display( $tpl );
	}
}
