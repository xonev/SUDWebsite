<?php
/**
 * The default template for the contact view.
 * @version $Id: default.php 204 2009-03-20 07:12:33Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );


if ($this->row->image == '') {
	$this->row->image = 'blank.png';
}

JHTML::_('behavior.tooltip');
jimport('joomla.html.pane');

JFilterOutput::objectHTMLSafe( $this->row, ENT_QUOTES, 'misc' );
?>
<script language="javascript" type="text/javascript">
<!--
function validateOrdering() {
	var form = document.adminForm;
	var index = 0;
	var checked_all = false;
	while ( !checked_all ) {
		try {
			if ( !$defined( document.getElementById( "con_position_order" + index ) ) ) {
				checked_all = true;
			}
			else {
				order = document.getElementById( "con_position_order" + index );
				var pattern = /[^\d]/;
				if ( pattern.test( order.value ) ) {
					return false;
				}
			}
			index++;
		}
		catch (error) {
			alert(error);
		}
	}
	return true;
}

function submitbutton(pressbutton) {
	var form = document.adminForm;
	form.catid.value = form.catid0.value;
	if (pressbutton == 'cancel') {
		submitform( pressbutton );
		return;
	}

	// do field validation
	if ( form.name.value == "" ) {
		alert( "<?php echo JText::_( 'You must provide a name.', true ); ?>" );
	} else if ( form.catid.value == 0 ) {
		alert( "<?php echo JText::_( 'Please select a Category.', true ); ?>" );
	} else if ( !validateOrdering() ) {
		alert( "<?php echo JText::_( 'All position ordering input must be numbers.', true); ?>" );
	} else {
		submitform( pressbutton );
	}
}

function deletePosition( positionId ) {
	var form = document.adminForm;
	form.positionToDelete.value = parseInt(positionId);
	submitbutton( 'apply' );
}
//-->
</script>

<form action="index.php" method="post" name="adminForm">

<div class="col width-60">
	<fieldset class="adminform">
		<legend><?php echo JText::_( 'Details' ); ?></legend>

		<table class="admintable">
		<tr>
			<td class="key">
				<label for="first_name">
					<?php echo JText::_( 'First Name' ); ?>:
				</label>
			</td>
			<td >
				<input class="inputbox" type="text" name="first_name" id="name" size="60" maxlength="128" value="<?php echo $this->row->first_name; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="last_name">
					<?php echo JText::_( 'Last Name' ); ?>:
				</label>
			</td>
			<td >
				<input class="inputbox" type="text" name="last_name" id="name" size="60" maxlength="128" value="<?php echo $this->row->last_name; ?>" />
			</td>
		<tr>
			<td class="key">
				<label for="name">
					<?php echo JText::_( 'Alias' ); ?>:
				</label>
			</td>
			<td >
				<input class="inputbox" type="text" name="alias" id="alias" size="60" maxlength="255" value="<?php echo $this->row->alias; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<?php echo JText::_( 'Published' ); ?>:
			</td>
			<td>
				<?php echo $this->lists['published']; ?>
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="user_id">
					<?php echo JText::_( 'Linked to User' ); ?>:
				</label>
			</td>
			<td >
				<?php echo $this->lists['user_id'];?>
			</td>
		</tr>
		<tr>
			<td valign="top" class="key">
				<label for="ordering">
					<?php echo JText::_( 'Ordering' ); ?>:
				</label>
			</td>
			<td>
				<?php echo $this->lists['ordering']; ?>
			</td>
		</tr>
		<tr>
			<td valign="top" class="key">
				<label for="access">
					<?php echo JText::_( 'Access' ); ?>:
				</label>
			</td>
			<td>
				<?php echo $this->lists['access']; ?>
			</td>
		</tr>
		<?php
		if ($this->row->id) {
			?>
			<tr>
				<td class="key">
					<label>
						<?php echo JText::_( 'ID' ); ?>:
					</label>
				</td>
				<td>
					<strong><?php echo $this->row->id;?></strong>
				</td>
			</tr>
			<?php
		}
		?>
		</table>
	</fieldset>

	<fieldset class="adminform">
		<legend><?php echo JText::_( 'Information' ); ?></legend>

		<table class="admintable">
		<?php 
		if ( !empty( $this->lists['positions'] ) ):
			$index = 0;
			foreach ( $this->lists['positions'] as $position ) : ?>
				<tr>
					<td class="key">
					<label for="con_position<?php echo $index; ?>">
						<?php echo JText::_( 'Contact\'s Position' ); ?>:
						</label>
					</td>
					<td class="position" >
						<input name="positionid<?php echo $index; ?>" type="hidden" value="<?php echo $position->id; ?>" />
						<input class="inputbox" type="text" name="con_position<?php echo $index; ?>" id="con_position<?php echo $index; ?>" size="60" maxlength="255" value="<?php echo $position->position; ?>" />
						<?php echo JText::_( 'Order:' ); ?><input class="inputbox" type="text" name="con_position_order<?php echo $index; ?>" id="con_position_order<?php echo $index; ?>" size="5" maxlength="4" value="<?php echo $position->ordering; ?>" />
						<?php echo $this->lists['catid'][$index];?>
						<?php if ( !empty( $position->position ) ): ?>
							<a href="#" onclick="javascript: deletePosition( <?php echo $position->id; ?> )" >
								<img src="images/icon-16-delete-position.png" alt="Delete Position" />
							</a>
						<?php else: ?>
							<a href="#" onclick="javascript: submitbutton('apply')" >
								<img src="images/icon-16-add-position.png" alt="Add Position" />
							</a>
						<?php endif; ?>								
					</td>
				</tr>
				<?php 
				$index++;
			endforeach;
		else:?>
			<tr>
				<td class="key">
				<label for="con_position0">
					<?php echo JText::_( 'Contact\'s Position' ); ?>:
					</label>
				</td>
				<td class="position" >
					<input name="positionid0" type="hidden" value="0" />
					<input class="inputbox" type="text" name="con_position0" id="con_position0" size="60" maxlength="255" value="" />
					<?php echo JText::_( 'Order:' ); ?><input class="inputbox" type="text" name="con_position_order0" id="con_position_order0" size="5" maxlength="4" value="<?php echo $position->ordering; ?>" />
					<?php echo $this->lists['catid'];?>
					<a href="#" onclick="javascript: submitbutton('apply')" >
								<img src="images/icon-16-add-position.png" alt="Add Position" />
					</a>
				</td>
			</tr>
		<?php endif; ?>
		<tr>
			<td class="key">
				<label for="email_to">
					<?php echo JText::_( 'E-mail' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="email_to" id="email_to" size="60" maxlength="255" value="<?php echo $this->row->email_to; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key" valign="top">
				<label for="address">
					<?php echo JText::_( 'Street Address' ); ?>:
					</label>
				</td>
				<td>
					<textarea name="address" id="address" rows="3" cols="45" class="inputbox"><?php echo $this->row->address; ?></textarea>
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="suburb">
					<?php echo JText::_( 'Town/Suburb' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="suburb" id="suburb" size="60" maxlength="100" value="<?php echo $this->row->suburb;?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="state">
					<?php echo JText::_( 'State/County' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="state" id="state" size="60" maxlength="100" value="<?php echo $this->row->state;?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="postcode">
					<?php echo JText::_( 'Postal Code/ZIP' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="postcode" id="postcode" size="60" maxlength="100" value="<?php echo $this->row->postcode; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="country">
					<?php echo JText::_( 'Country' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="country" id="country" size="60" maxlength="100" value="<?php echo $this->row->country;?>" />
			</td>
		</tr>
		<tr>
			<td class="key" valign="top">
			<label for="telephone">
			<?php echo JText::_( 'Telephone' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="telephone" id="telephone" size="60" maxlength="255" value="<?php echo $this->row->telephone; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key" valign="top">
				<label for="mobile">
					<?php echo JText::_( 'Mobile' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="mobile" id="mobile" size="60" maxlength="255" value="<?php echo $this->row->mobile; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key" valign="top">
				<label for="fax">
					<?php echo JText::_( 'Fax' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="fax" id="fax" size="60" maxlength="255" value="<?php echo $this->row->fax; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="webpage">
					<?php echo JText::_( 'Webpage' ); ?>:
				</label>
			</td>
			<td>
				<input class="inputbox" type="text" name="webpage" id="webpage" size="60" maxlength="255" value="<?php echo $this->row->webpage; ?>" />
			</td>
		</tr>
		<tr>
			<td  class="key" valign="top">
				<label for="misc">
					<?php echo JText::_( 'Miscellaneous Info' ); ?>:
				</label>
			</td>
			<td>
				<textarea name="misc" id="misc" rows="5" cols="45" class="inputbox"><?php echo $this->row->misc; ?></textarea>
			</td>
		</tr>
		<tr>
			<td class="key">
				<label for="image">
					<?php echo JText::_( 'Image' ); ?>:
				</label>
			</td>
			<td >
				<?php echo $this->lists['image']; ?>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<script language="javascript" type="text/javascript">
				if (document.forms.adminForm.image.options.value!=''){
					jsimg='../<?echo $this->cparams->get('image_path'); ?>/' + getSelectedValue( 'adminForm', 'image' );
				} else {
					jsimg='../images/M_images/blank.png';
				}
				document.write('<img src=' + jsimg + ' name="imagelib" width="100" height="100" border="2" alt="<?php echo JText::_( 'Preview' ); ?>" />');
				</script>
			</td>
		</tr>
		</table>
	</fieldset>
</div>

<div class="col width-40">
	<fieldset class="adminform">
		<legend><?php echo JText::_( 'Parameters' ); ?></legend>

		<?php
			echo $this->pane->startPane("menu-pane");
			echo $this->pane->startPanel(JText :: _('Contact Parameters'), "param-page");
			echo $this->params->render();
			echo $this->pane->endPanel();
			echo $this->pane->startPanel(JText :: _('Advanced Parameters'), "param-page");
			echo $this->params->render('params', 'advanced');
			echo $this->pane->endPanel();
			echo $this->pane->startPanel(JText :: _('E-mail Parameters'), "param-page");
			echo $this->params->render('params', 'email');
			echo $this->pane->endPanel();
			echo $this->pane->endPane();
		?></fieldset>
</div>
<div class="clr"></div>

<input type="hidden" name="option" value="<?php echo $this->option; ?>" />
<input type="hidden" name="id" value="<?php echo $this->row->id; ?>" />
<input type="hidden" name="cid[]" value="<?php echo $this->row->id; ?>" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="catid" value="" />
<input type="hidden" name="positionToDelete" value="" />
<input type="hidden" name="controller" value="contacts" />
<?php echo JHTML::_( 'form.token' ); ?>
</form>

