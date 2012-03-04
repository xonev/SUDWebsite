<?php
/**
 * @version $Id: view.html.php 188 2009-03-16 12:06:57Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * The view for showing the churches in a conference.
 * @package Joomla
 * @subpackage Directory
 */
class DirectoryViewConference extends JView
{
	/**
	 * Displays the view.
	 * @param string $tpl
	 */
	function display( $tpl = null )
	{
		$churchList = $this->get( 'Churches' );
		$conference = $this->get( 'Conference' );
		$pagination = $this->get( 'Pagination' );

		$this->_setBreadcrumbs( $conference );

		$orderBy = $this->get( 'orderBy' );
		$orderDir = $this->get( 'orderDir' );
		$this->assignRef( 'pagination', $pagination );
		$this->assignRef( 'churches', $churchList );
		$this->assignRef( 'conference', $conference );
		$this->assignRef( 'order_by', $orderBy );
		$this->assignRef( 'order_dir', $orderDir );
		$uri =& JFactory::getURI();
		$this->assign( 'action', $uri->toString() );
		parent::display( $tpl );
	}

	/**
	 * Sets the breadcrumbs item.
	 * @access protected
	 * @param object &$conference the conference object
	 */
	function _setBreadcrumbs( $conference )
	{
				//Add item to breadcrumbs
		$mainframe =& JApplication::getInstance( 'site' );
		$breadcrumbs =& $mainframe->getPathway();
		if ( $conference->id ) {
			$breadcrumbs->addItem(
				$conference->name,
				'index.php?option=com_directory&view=conference&cid[]=' . $conference->id
			);
		}
		else {
			$breadcrumbs->addItem(
				JText::_( 'All Churches' ),
				'index.php?option=com_directory&view=conference&cid[]=0'
			);
		}
	}
}
