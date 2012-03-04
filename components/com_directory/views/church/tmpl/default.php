<?php
/**
 * The church view template.
 * @version $Id: default.php 221 2009-03-27 05:24:05Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<?php $church =& $this->church; ?>
<div class="componentheading">
	<?php echo $church->name; ?>
</div>
<ul class="addressInformation">
	<li><b>Address:</b>
		<ul>
			<li><?php echo $church->street; ?></li>
			<?php if ( !empty($church->street2) ): ?>
				<li><?php echo $church->street2; ?></li>
			<?php endif; ?>
			<li><?php echo $church->city; ?></li>
			<li><?php echo $church->state; ?></li>
			<?php if ( !empty($church->telephone) ): ?>
				<li><b>Telephone:</b>&nbsp;<?php echo $church->telephone; ?></li>
			<?php endif; ?>
		</ul>
	</li>
	<li><b>Church Section:</b> <?php echo $church->conference; ?></li>
</ul>

