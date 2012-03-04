<?php
/**
 * The churches template.
 * @version $Id: default.php 188 2009-03-16 12:06:57Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>

<script language="javascript" type="text/javascript">
	/**
	 * Submit the admin form
	 */
	function submitform(pressbutton){
		if (pressbutton) {
			document.adminForm.task.value=pressbutton;
		}
		else {
			document.adminForm.controller.value = "churches";
			document.adminForm.task.value = "viewchurches";
		}
		if (typeof document.adminForm.onsubmit == "function") {
			document.adminForm.onsubmit();
		}
		document.adminForm.submit();
	}
	function tableOrdering( order, dir, task ) {
		var form = document.adminForm;
		form.controller.value = "churches";
		form.orderby.value 	= order;
		form.orderdir.value	= dir;
		submitform( task );
	}

</script>

<form action="<?php echo $this->action; ?>" method="post" name="adminForm" >
	<div id="editcell">
	<?php if ( !empty($this->churches) ): ?>
		<table class="adminlist">
			<thead>
				<tr>
					<th width="5">
						<?php echo JHTML::_( 'grid.sort', 'ID', 'church.id', $this->orderDir, $this->orderBy, 'viewchurches' ); ?>
					</th>
					<th width="20">
						<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->churches ); ?>);" />
					</th>
					<th>
						<?php echo JHTML::_( 'grid.sort', 'Name', 'church.name', $this->orderDir, $this->orderBy, 'viewchurches' ); ?>
					</th>
					<th>
						<?php echo JHTML::_( 'grid.sort', 'City', 'church.city', $this->orderDir, $this->orderBy, 'viewchurches' ); ?>
					</th>
					<th>
						<?php echo JHTML::_( 'grid.sort', 'State', 'state', $this->orderDir, $this->orderBy, 'viewchurches' ); ?>
					</th>
					<th>
						<?php echo JHTML::_( 'grid.sort', 'Conference', 'conference', $this->orderDir, $this->orderBy, 'viewchurches' ); ?>
					</th>
				</tr>
			</thead>
			<tbody>
				<?php
					$k = 0;
					$rowNum = 0;
					foreach ( $this->churches as $church ):
						$checked = JHTML::_( 'grid.id', $rowNum, $church->id );
						$link = JRoute::_(
							'index.php?option=com_directory&controller=church&task=edit&cid[]='
							. $church->id );
						?>
						<tr class="<?php echo 'row'.$k; ?>">
							<td>
								<?php echo $church->id; ?>
							</td>
							<td>
								<?php echo $checked; ?>
							</td>
							<td>
								<a href="<?php echo $link; ?>"><?php echo $church->name; ?></a>
							</td>
							<td>
								<?php echo $church->city; ?>
							</td>
							<td>
								<?php echo $church->state; ?>
							</td>
							<td>
								<?php echo $church->conference; ?>
							</td>
						</tr>
				<?php
						$k = 1 - $k;
						++$rowNum;
					endforeach;?>
			</tbody>
			<tfoot>
				<tr>
				  <td colspan="9"><?php echo $this->pagination->getListFooter(); ?></td>
				</tr>
			</tfoot>
		</table>
	<?php
	else:
		echo JText::_( 'There are no churches in the database.' );
	endif;
	?>
	</div>

	<input type="hidden" name="option" value="com_directory" />
	<input type="hidden" name="orderby" value="<?php echo $this->orderBy; ?>" />
	<input type="hidden" name="orderdir" value="<?php echo $this->orderDir; ?>" />
	<input type="hidden" name="controller" value="church" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="boxchecked" value="0" />
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
