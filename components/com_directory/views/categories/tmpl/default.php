<?php
/**
 * The conferences template.
 * @version $Id: default.php 181 2009-03-10 09:12:16Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<div class="componentheading" >
	<?php echo JText::_( 'Departments' ); ?>
</div>
<ul>
	<?php foreach ( $this->items as $item ): ?>
		<li>
			<a href="<?php echo $item->link; ?>" class="category <?php echo $this->params->get( 'pageclass_sfx' ); ?>">
					<?php echo $item->title; ?></a>
		</li>
	<?php endforeach; ?>
</ul>

