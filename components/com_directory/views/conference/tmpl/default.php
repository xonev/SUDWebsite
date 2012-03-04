<?php
/**
 * The conference template
 * @version $Id: default.php 188 2009-03-16 12:06:57Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>

<script language="javascript" type="text/javascript">
	function tableOrdering( order, dir, task ) {
		var form = document.adminForm;

		form.order_by.value 	= order;
		form.order_dir.value	= dir;
		document.adminForm.submit( task );
	}
</script>

<div class="componentheading">
	<?php if ( $this->conference !== false ): ?>
		<?php echo $this->conference->name; ?>
	<?php else: ?>
		<?php echo JText::_( 'Churches' ); ?>
	<?php endif; ?>
</div>

<?php if ( !empty( $this->churches ) ): ?>
	<form action="<?php echo $this->action; ?>" method="post" name="adminForm">
		<table width=100%>
			<thead>
				<tr>
					<td class="sectiontableheader"><?php echo JHTML::_( 'grid.sort', 'Name', 'church.name', $this->order_dir, $this->order_by ); ?></td>
					<td class="sectiontableheader"><?php echo JHTML::_( 'grid.sort', 'Location', 'church.city', $this->order_dir, $this->order_by ); ?></td>
					<td class="sectiontableheader"><?php echo JHTML::_( 'grid.sort', 'State', 'state', $this->order_dir, $this->order_by ); ?></td>
				</tr>
			</thead>
			<tbody>
				<?php $k = 1; ?>
				<?php foreach ( $this->churches as $church ): ?>
					<?php $link = 'index.php?option=com_directory&view=church&cid[]=' .
							$church->id . '&conference_id=' . $this->conference->id; ?>
					<tr class="sectiontableentry<?php echo $k + 1; ?>">
						<td>
							<a href="<?php echo $link; ?>" class="category">
								<?php echo $church->name; ?>
							</a>
						</td>
						<td><?php echo $church->city; ?></td>
						<td><?php echo $church->state; ?></td>
					</tr>
					<?php $k = 1 - $k; ?>
				<?php endforeach; ?>
			</tbody>
			<tfoot>
				<tr>
				  <td colspan="9"><?php echo $this->pagination->getListFooter(); ?></td>
				</tr>
			</tfoot>
		</table>
		<input type="hidden" name="order_by" value="<?php echo $this->order_by; ?>" />
		<input type="hidden" name="order_dir" value="<?php echo $this->order_dir; ?>" />
	</form>

<?php else: ?>
	<p>
		<?php echo JText::_( 'There are no churches for this section.' ); ?>
	</p>
<?php endif; ?>
