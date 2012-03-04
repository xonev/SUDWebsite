<?php
/**
 * The default template for conference editing
 * @version $Id: default.php 174 2009-02-16 13:32:54Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<form action="index.php" method="post" name="adminForm" id="adminForm">
	<div class="col100">
		<fieldset class="adminform">
			<legend><?php echo JText::_( 'Conference Details' ); ?></legend>

			<table class="admintable">
				<tr>
					<td width="100" class="key" align="right">
						<label for="name">
							<?php echo JText::_( "The Conference Name" ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="name"
							id="name" size="32" maxlength="255" value="<?php echo $this->conference->name; ?>" />
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="category_id">
							<?php echo JText::_( "Category" ); ?>
						</label>
					</td>
					<td>
						<?php echo $this->categorySelection; ?>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="clr"></div>

	<input type="hidden" name="option" value="com_directory" />
	<input type="hidden" name="id" value="<?php echo $this->conference->id; ?>" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="controller" value="conference" />
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
