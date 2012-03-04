<?php
/**
 * The template for editing a contact section.
 * @version $Id: default.php 211 2009-03-23 10:44:25Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

?>
<form action="index.php?option=com_directory" method="post" name="adminForm">
	<div class="col width-60">
		<fieldset class="adminform">
			<legend><?php echo JText::_( 'Section Information' ); ?></legend>
			<table class="admintable">
				<tr>
					<td class="key" >
						<label for="name">
							<?php echo JText::_( 'Section Name' ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="name" id="section_name" size="60" maxlength="255" value="<?php echo $this->section->name; ?>" />
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<?php echo JHTML::_( 'form.token' ); ?>
	<input type="hidden" name="id" value="<?php echo $this->section->id; ?>" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="controller" value="contacts" />
</form>