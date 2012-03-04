<?php
/**
 * @version $Id: default.php 211 2009-03-23 10:44:25Z adventi4 $
 * @package 
 * @subpackage 
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>

<form action="index.php?option=com_directory" method="post" name="adminForm">
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="boxchecked" value="0" />
	<?php echo JHTML::_( 'form.token' ); ?>
	<table class="adminlist">
		<thead>
			<th width="10" class="title">
				<?php echo JText::_( '' ); ?>
			</th>
			<th width="10" class="title">
				<?php echo JText::_( 'Id' ); ?>
			</th>
			<th class="title">
				<?php echo JText::_( 'Name' ); ?>
			</th>
		</thead>
		<tbody>
			<?php
			if ( !empty( $this->rows ) ):
				$k = 0;
				$row_number = 0;
				foreach( $this->rows as $row ) : ?>
					<tr class="row<?php echo $k; ?>">
						<td>
							<?php echo JHTML::_('grid.id', $row_number, $row->id, false, 'sectionid'); ?>
						</td>
						<td>
							<a href="<?php echo JRoute::_( 'index.php?option=com_directory&controller=contacts&task=editsection&sectionid[]=' . $row->id ); ?>" ><?php echo JText::_( $row->id ); ?></a>
						</td>
						<td>
							<a href="<?php echo JRoute::_( 'index.php?option=com_directory&controller=contacts&task=editsection&sectionid[]=' . $row->id ); ?>" ><?php echo JText::_( $row->name ); ?></a>
						</td>
					</tr>
					<?php
					$row_number++;
				endforeach; ?>
			<?php else: ?>
				<?php echo JText::_( 'There are no sections to be displayed' ); ?>
			<?php endif; ?>
		</tbody>
	</table>
	<input type="hidden" name="controller" value="contacts" />
</form>