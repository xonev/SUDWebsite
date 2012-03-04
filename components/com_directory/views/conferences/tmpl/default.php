<?php
/**
 * The conferences template.
 * @version $Id: default.php 184 2009-03-12 09:28:44Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<div class="componentheading" >
	<?php echo JText::_( 'Church Sections' ); ?>
</div>
<ul>
	<li>
		<a class="category"
			href="index.php?option=com_directory&view=conference&cid[]=0">
			<?php echo JText::_( 'All Churches' ); ?>
		</a>
	</li>
	<?php foreach ( $this->conferences as $conference ): ?>
		<li>
			<a class="category"
				href="index.php?option=com_directory&view=conference&cid[]=<?php echo $conference->id; ?>" >
				<?php echo $conference->name; ?>
			</a>
		</li>
	<?php endforeach; ?>
</ul>
