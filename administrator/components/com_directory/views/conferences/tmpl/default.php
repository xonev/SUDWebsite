<?php
/**
 * The default conferences template.
 * @version $Id: default.php 174 2009-02-16 13:32:54Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<form action="index.php" method="post" name="adminForm">
	<div id="editcell">
	<?php if ( !empty($this->conferences) ): ?>
		<table class="adminlist">
			<thead>
				<tr>
					<th width="5">
						<?php echo JText::_( 'ID' ); ?>
					</th>
					<th width="20">
						<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->conferences ); ?>);" />
					</th>
					<th>
						<?php echo JText::_( 'Conference' ); ?>
					</th>
				</tr>
			</thead>
			<tbody>
				<?php
					$k = 0;
					$rowNum = 0;
					foreach ( $this->conferences as $conference ):
						$checked = JHTML::_( 'grid.id', $rowNum, $conference->id );
						$link = JRoute::_(
							'index.php?option=com_directory&controller=conference&task=edit&cid[]='
							. $conference->id );
						?>
						<tr class="<?php echo 'row'.$k; ?>">
							<td>
								<?php echo $conference->id; ?>
							</td>
							<td>
								<?php echo $checked; ?>
							</td>
							<td>
								<a href="<?php echo $link; ?>"><?php echo $conference->name; ?></a>
							</td>
						</tr>
				<?php
						$k = 1 - $k;
						++$rowNum;
					endforeach;?>
			</tbody>
		</table>
	<?php
	else:
		echo JText::_( 'There are no conferences in the database.' );
	endif;
	?>
	</div>

	<input type="hidden" name="option" value="com_directory" />
	<input type="hidden" name="controller" value="conference" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="boxchecked" value="0" />
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
