<?php

defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.application.component.view');

class DirectoryViewCategories extends JView {
	var $alternatingNumber;
	
	function display( $tpl = null ) {
		global $mainframe;
		//Display a table containing a link to each department on a separate row
		$params =& $mainframe->getParams();
		$model =& $this->getModel();
		
		// get the contact section to display
		$options[ 'contact_section' ] = JRequest::getVar( 'contact_section', 0, '', 'int');
		$categories = $model->getCategories( $options );
		$this->_setCategoryProperties($categories);
		
		$this->assignRef( 'items', $categories );
		$this->assignRef( 'params', $params );
		
		$uri =& JFactory::getURI();
		$this->assign('action',		$uri->toString());
		parent::display( $tpl );
	}
	
	function _setCategoryProperties( &$categories ) {
		$this->alternatingNumber = 0;
		foreach( $categories as &$category ) {
			$this->_setRowAlternation( $category );
			$this->_setCategoryLink( $category );
		}
	}
	
	/**
	 * Sets the odd members of a list of classes
	 * @access private
	 * @param $object the object to set alternation on
	 */
	function _setRowAlternation( &$object ) {
		$object->alternatingNumber = $this->alternatingNumber;
		$this->alternatingNumber = 1 - $this->alternatingNumber;
	}
	
	function _setCategoryLink( &$category ) {
		$category->link = JRoute::_( 'index.php?option=com_directory&view=category&catid='
			. $category->catslug );
	}
}
