<?php
/**
 * The template for the contacts view.
 * @version $Id: default.php 219 2009-03-26 11:14:31Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

//Ordering allowed ?
$ordering = ($this->lists['order'] == 'cd.ordering');

JHTML::_('behavior.tooltip');
?>
<form action="index.php?option=com_directory" method="post" name="adminForm">

<table>
<tr>
	<td align="left" width="100%">
		<?php echo JText::_( 'Filter' ); ?>:
		<input type="text" name="search" id="search" value="<?php echo $this->lists['search'];?>" class="text_area" onchange="document.adminForm.submit();" />
		<button onclick="this.form.submit();"><?php echo JText::_( 'Go' ); ?></button>
		<button onclick="document.getElementById('search').value='';this.form.getElementById('filter_catid').value='0';this.form.getElementById('filter_sectionid').value='0';this.form.getElementById('filter_state').value='';this.form.submit();"><?php echo JText::_( 'Reset' ); ?></button>
	</td>
	<td nowrap="nowrap">
		<?php
		echo $this->lists['sectionid'];
		echo $this->lists['catid'];
		echo $this->lists['state'];
		?>
	</td>
</tr>
</table>

	<table class="adminlist">
	<thead>
		<tr>
			<th width="10">
				<?php echo JText::_( 'Num' ); ?>
			</th>
			<th width="10" class="title">
				<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count($this->rows); ?>);" />
			</th>
			<th class="title">
				<?php echo JHTML::_('grid.sort',   'First Name', 'cd.first_name', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
			</th>
			<th class="title">
				<?php echo JHTML::_( 'grid.sort', 'Last Name', 'cd.last_name', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
			</th>
			<th width="5%" class="title" nowrap="nowrap">
				<?php echo JHTML::_('grid.sort',   'Published', 'cd.published', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
			</th>
			<?php if ( $this->showCategoryOrdering ): ?>
				<th nowrap="nowrap" width="8%">
					<?php echo JHTML::_('grid.sort',   'Order by', 'cd.ordering', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
					<?php echo JHTML::_('grid.order',  $this->rows ); ?>
				</th>
			<?php endif; ?>
			<th width="8%" nowrap="nowrap">
				<?php echo JHTML::_('grid.sort',   'Access', 'cd.access', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
			</th>
			<?php if ( $this->showCategoryOrdering ): ?>
				<th width="10%" class="title">
					<?php echo JHTML::_('grid.sort',   'Category', 'category', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
				</th>
			<?php endif; ?>
			<th class="title" nowrap="nowrap" width="10%">
				<?php echo JHTML::_('grid.sort',   'Linked to User', 'user', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
			</th>
			<th width="1%" nowrap="nowrap">
				<?php echo JHTML::_('grid.sort',   'ID', 'cd.id', @$this->lists['order_Dir'], @$this->lists['order'] ); ?>
			</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="11">
				<?php echo $this->pageNav->getListFooter(); ?>
			</td>
		</tr>
	</tfoot>
	<tbody>
	<?php
	$k = 0;
	for ($i=0, $n=count($this->rows); $i < $n; $i++) {
		$row = $this->rows[$i];

		$link 		= JRoute::_( 'index.php?option=com_directory&controller=contacts&task=edit&cid[]='. $row->id );

		$checked 	= JHTML::_('grid.checkedout',   $row, $i );
		$access 	= JHTML::_('grid.access',   $row, $i );
		$published 	= JHTML::_('grid.published', $row, $i );

		$row->cat_link 	= JRoute::_( 'index.php?option=com_directory_categories&section=com_contact_details&task=edit&type=other&cid[]='. $row->catid );
		$row->user_link	= JRoute::_( 'index.php?option=com_users&task=edit&cid[]='. $row->user_id );
		?>
		<tr class="<?php echo "row$k"; ?>">
			<td>
				<?php echo $this->pageNav->getRowOffset( $i ); ?>
			</td>
			<td>
				<?php echo $checked; ?>
			</td>
			<td>
			<?php
			if (JTable::isCheckedOut($this->user->get ('id'), $row->checked_out )) :
				echo $row->first_name;
			else :
				?>
				<span class="editlinktip hasTip" title="<?php echo JText::_( 'Edit Contact' );?>::<?php echo $row->first_name . ' ' . $row->last_name; ?>">
				<a href="<?php echo $link; ?>">
					<?php echo $row->first_name; ?></a> </span>
				<?php
			endif;
			?>
			</td>
			<td>
			<?php
			if (JTable::isCheckedOut($this->user->get ('id'), $row->checked_out )) :
				echo $row->last_name;
			else :
				?>
				<span class="editlinktip hasTip" title="<?php echo JText::_( 'Edit Contact' );?>::<?php echo $row->first_name . ' ' . $row->last_name; ?>">
				<a href="<?php echo $link; ?>">
					<?php echo $row->last_name; ?></a> </span>
				<?php
			endif;
			?>
			</td>
			<td align="center">
				<?php echo $published;?>
			</td>
			<?php if ( $this->showCategoryOrdering ): ?>
				<td class="order">
					<span><?php echo $this->pageNav->orderUpIcon( $i, true, 'orderup', 'Move Up', $ordering ); ?></span>
					<span><?php echo $this->pageNav->orderDownIcon( $i, $n, true, 'orderdown', 'Move Down', $ordering ); ?></span>
					<?php $disabled = $ordering ?  '' : 'disabled="disabled"'; ?>
					<input type="text" name="order[]" size="5" value="<?php echo $row->ordering;?>" <?php echo $disabled ?> class="text_area" style="text-align: center" />
				</td>
			<?php endif; ?>
			<td align="center">
				<?php echo $access;?>
			</td>
			<?php if ( $this->showCategoryOrdering ): ?>
				<td>
					<a href="<?php echo $row->cat_link; ?>" title="<?php echo JText::_( 'Edit Category' ); ?>">
						<?php echo $row->category; ?></a>
				</td>
			<?php endif; ?>
			<td>
				<a href="<?php echo $row->user_link; ?>" title="<?php echo JText::_( 'Edit User' ); ?>">
					<?php echo $row->this->user; ?></a>
			</td>
			<td align="center">
				<?php echo $row->id; ?>
			</td>
		</tr>
		<?php
		$k = 1 - $k;
	}
	?>
	</tbody>
	</table>

<input type="hidden" name="option" value="<?php echo $this->option; ?>" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="boxchecked" value="0" />
<input type="hidden" name="filter_order" value="<?php echo $this->lists['order']; ?>" />
<input type="hidden" name="filter_order_Dir" value="<?php echo $this->lists['order_Dir']; ?>" />
<input type="hidden" name="controller" value="contacts" />
<?php echo JHTML::_( 'form.token' ); ?>
</form>
