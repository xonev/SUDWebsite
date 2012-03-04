<?php
/**
* @version		$Id: admin.directory.html.php 214 2009-03-24 05:10:38Z adventi4 $
* @package		Joomla
* @subpackage	Contact
* @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
* @package		Joomla
* @subpackage	Contact
*/
class HTML_contact
{
	/**
	 * Displays a list of contact sections.
	 * @param array_of_objects $rows a list of row objects retrieved from the
	 * contact sections table
	 */
	function showContactSections( $rows )
	{		
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
				$k = 0;
				$row_number = 0;
				foreach( $rows as $row ) : ?>
					<tr class="row<?php echo $k; ?>">
						<td>
							<?php echo JHTML::_('grid.id', $row_number, $row->id, false, 'sectionid'); ?>
						</td>
						<td>
							<a href="<?php echo JRoute::_( 'index.php?option=com_directory&task=editsection&sectionid[]=' . $row->id ); ?>" ><?php echo JText::_( $row->id ); ?></a>
						</td>
						<td>
							<a href="<?php echo JRoute::_( 'index.php?option=com_directory&task=editsection&sectionid[]=' . $row->id ); ?>" ><?php echo JText::_( $row->name ); ?></a>
						</td>
					</tr>
					<?php 
					$row_number++;
				endforeach; ?>
			</tbody>
		</table>
		</form>
		<?php
	}
	
	function showContacts( &$rows, &$pageNav, $option, &$lists )
	{
		$user =& JFactory::getUser();

		//Ordering allowed ?
		$ordering = ($lists['order'] == 'cd.ordering');

		JHTML::_('behavior.tooltip');
		?>
		<form action="index.php?option=com_directory" method="post" name="adminForm">

		<table>
		<tr>
			<td align="left" width="100%">
				<?php echo JText::_( 'Filter' ); ?>:
				<input type="text" name="search" id="search" value="<?php echo $lists['search'];?>" class="text_area" onchange="document.adminForm.submit();" />
				<button onclick="this.form.submit();"><?php echo JText::_( 'Go' ); ?></button>
				<button onclick="document.getElementById('search').value='';this.form.getElementById('filter_catid').value='0';this.form.getElementById('filter_state').value='';this.form.submit();"><?php echo JText::_( 'Reset' ); ?></button>
			</td>
			<td nowrap="nowrap">
				<?php
				echo $lists['catid'];
				echo $lists['state'];
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
						<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count($rows); ?>);" />
					</th>
					<th class="title">
						<?php echo JHTML::_('grid.sort',   'First Name', 'cd.first_name', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
					<th class="title">
						<?php echo JHTML::_( 'grid.sort', 'Last Name', 'cd.last_name', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
					<th width="5%" class="title" nowrap="nowrap">
						<?php echo JHTML::_('grid.sort',   'Published', 'cd.published', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
					<th nowrap="nowrap" width="8%">
						<?php echo JHTML::_('grid.sort',   'Order by', 'cd.ordering', @$lists['order_Dir'], @$lists['order'] ); ?>
						<?php echo JHTML::_('grid.order',  $rows ); ?>
					</th>
					<th width="8%" nowrap="nowrap">
						<?php echo JHTML::_('grid.sort',   'Access', 'cd.access', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
					<th width="10%" class="title">
						<?php echo JHTML::_('grid.sort',   'Category', 'category', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
					<th class="title" nowrap="nowrap" width="10%">
						<?php echo JHTML::_('grid.sort',   'Linked to User', 'user', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
					<th width="1%" nowrap="nowrap">
						<?php echo JHTML::_('grid.sort',   'ID', 'cd.id', @$lists['order_Dir'], @$lists['order'] ); ?>
					</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="11">
						<?php echo $pageNav->getListFooter(); ?>
					</td>
				</tr>
			</tfoot>
			<tbody>
			<?php
			$k = 0;
			for ($i=0, $n=count($rows); $i < $n; $i++) {
				$row = $rows[$i];

				$link 		= JRoute::_( 'index.php?option=com_directory&controller=contacts&task=edit&cid[]='. $row->id );

				$checked 	= JHTML::_('grid.checkedout',   $row, $i );
				$access 	= JHTML::_('grid.access',   $row, $i );
				$published 	= JHTML::_('grid.published', $row, $i );

				$row->cat_link 	= JRoute::_( 'index.php?option=com_categories&section=com_contact_details&task=edit&type=other&cid[]='. $row->catid );
				$row->user_link	= JRoute::_( 'index.php?option=com_users&task=editA&cid[]='. $row->user_id );
				?>
				<tr class="<?php echo "row$k"; ?>">
					<td>
						<?php echo $pageNav->getRowOffset( $i ); ?>
					</td>
					<td>
						<?php echo $checked; ?>
					</td>
					<td>
					<?php
					if (JTable::isCheckedOut($user->get ('id'), $row->checked_out )) :
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
					if (JTable::isCheckedOut($user->get ('id'), $row->checked_out )) :
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
					<td class="order">
						<span><?php echo $pageNav->orderUpIcon( $i, ( $row->catid == @$rows[$i-1]->catid ), 'orderup', 'Move Up', $ordering ); ?></span>
						<span><?php echo $pageNav->orderDownIcon( $i, $n, ( $row->catid == @$rows[$i+1]->catid ), 'orderdown', 'Move Down', $ordering ); ?></span>
						<?php $disabled = $ordering ?  '' : 'disabled="disabled"'; ?>
						<input type="text" name="order[]" size="5" value="<?php echo $row->ordering;?>" <?php echo $disabled ?> class="text_area" style="text-align: center" />
					</td>
					<td align="center">
						<?php echo $access;?>
					</td>
					<td>
						<a href="<?php echo $row->cat_link; ?>" title="<?php echo JText::_( 'Edit Category' ); ?>">
							<?php echo $row->category; ?></a>
					</td>
					<td>
						<a href="<?php echo $row->user_link; ?>" title="<?php echo JText::_( 'Edit User' ); ?>">
							<?php echo $row->user; ?></a>
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

		<input type="hidden" name="option" value="<?php echo $option; ?>" />
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="boxchecked" value="0" />
		<input type="hidden" name="filter_order" value="<?php echo $lists['order']; ?>" />
		<input type="hidden" name="filter_order_Dir" value="<?php echo $lists['order_Dir']; ?>" />
		<?php echo JHTML::_( 'form.token' ); ?>
		</form>
		<?php
	}

	function editContact( &$row, &$lists, $option, &$params ) {

		JRequest::setVar( 'hidemainmenu', 1 );

		if ($row->image == '') {
			$row->image = 'blank.png';
		}

		JHTML::_('behavior.tooltip');
		jimport('joomla.html.pane');
        // TODO: allowAllClose should default true in J!1.6, so remove the array when it does.
		$pane = &JPane::getInstance('sliders', array('allowAllClose' => true));

		JFilterOutput::objectHTMLSafe( $row, ENT_QUOTES, 'misc' );
		$cparams = JComponentHelper::getParams ('com_media');
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
						<input class="inputbox" type="text" name="first_name" id="name" size="60" maxlength="128" value="<?php echo $row->first_name; ?>" />
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="last_name">
							<?php echo JText::_( 'Last Name' ); ?>:
						</label>
					</td>
					<td >
						<input class="inputbox" type="text" name="last_name" id="name" size="60" maxlength="128" value="<?php echo $row->last_name; ?>" />
					</td>
				<tr>
					<td class="key">
						<label for="name">
							<?php echo JText::_( 'Alias' ); ?>:
						</label>
					</td>
					<td >
						<input class="inputbox" type="text" name="alias" id="alias" size="60" maxlength="255" value="<?php echo $row->alias; ?>" />
					</td>
				</tr>
				<tr>
					<td class="key">
						<?php echo JText::_( 'Published' ); ?>:
					</td>
					<td>
						<?php echo $lists['published']; ?>
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="user_id">
							<?php echo JText::_( 'Linked to User' ); ?>:
						</label>
					</td>
					<td >
						<?php echo $lists['user_id'];?>
					</td>
				</tr>
				<tr>
					<td valign="top" class="key">
						<label for="ordering">
							<?php echo JText::_( 'Ordering' ); ?>:
						</label>
					</td>
					<td>
						<?php echo $lists['ordering']; ?>
					</td>
				</tr>
				<tr>
					<td valign="top" class="key">
						<label for="access">
							<?php echo JText::_( 'Access' ); ?>:
						</label>
					</td>
					<td>
						<?php echo $lists['access']; ?>
					</td>
				</tr>
				<?php
				if ($row->id) {
					?>
					<tr>
						<td class="key">
							<label>
								<?php echo JText::_( 'ID' ); ?>:
							</label>
						</td>
						<td>
							<strong><?php echo $row->id;?></strong>
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
				if ( !empty( $lists['positions'] ) ):
					$index = 0;
					foreach ( $lists['positions'] as $position ) : ?>
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
								<?php echo $lists['catid'][$index];?>
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
							<?php echo JText::_( 'Order:' ); ?><input class="inputbox" type="text" name="con_position_order<?php echo $index; ?>" id="con_position_order<?php echo $index; ?>" size="5" maxlength="4" value="<?php echo $position->ordering; ?>" />
							<?php echo $lists['catid'];?>
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
						<input class="inputbox" type="text" name="email_to" id="email_to" size="60" maxlength="255" value="<?php echo $row->email_to; ?>" />
					</td>
				</tr>
				<tr>
					<td class="key" valign="top">
						<label for="address">
							<?php echo JText::_( 'Street Address' ); ?>:
							</label>
						</td>
						<td>
 							<textarea name="address" id="address" rows="3" cols="45" class="inputbox"><?php echo $row->address; ?></textarea>
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="suburb">
							<?php echo JText::_( 'Town/Suburb' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="suburb" id="suburb" size="60" maxlength="100" value="<?php echo $row->suburb;?>" />
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="state">
							<?php echo JText::_( 'State/County' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="state" id="state" size="60" maxlength="100" value="<?php echo $row->state;?>" />
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="postcode">
							<?php echo JText::_( 'Postal Code/ZIP' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="postcode" id="postcode" size="60" maxlength="100" value="<?php echo $row->postcode; ?>" />
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="country">
							<?php echo JText::_( 'Country' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="country" id="country" size="60" maxlength="100" value="<?php echo $row->country;?>" />
					</td>
				</tr>
				<tr>
					<td class="key" valign="top">
					<label for="telephone">
					<?php echo JText::_( 'Telephone' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="telephone" id="telephone" size="60" maxlength="255" value="<?php echo $row->telephone; ?>" />
  					</td>
				</tr>
				<tr>
					<td class="key" valign="top">
						<label for="mobile">
							<?php echo JText::_( 'Mobile' ); ?>:
						</label>
					</td>
					<td>
 						<input class="inputbox" type="text" name="mobile" id="mobile" size="60" maxlength="255" value="<?php echo $row->mobile; ?>" />
					</td>
				</tr>
				<tr>
					<td class="key" valign="top">
						<label for="fax">
							<?php echo JText::_( 'Fax' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="fax" id="fax" size="60" maxlength="255" value="<?php echo $row->fax; ?>" />
 					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="webpage">
							<?php echo JText::_( 'Webpage' ); ?>:
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="webpage" id="webpage" size="60" maxlength="255" value="<?php echo $row->webpage; ?>" />
					</td>
				</tr>
				<tr>
					<td  class="key" valign="top">
						<label for="misc">
							<?php echo JText::_( 'Miscellaneous Info' ); ?>:
						</label>
					</td>
					<td>
						<textarea name="misc" id="misc" rows="5" cols="45" class="inputbox"><?php echo $row->misc; ?></textarea>
					</td>
				</tr>
				<tr>
					<td class="key">
						<label for="image">
							<?php echo JText::_( 'Image' ); ?>:
						</label>
					</td>
					<td >
						<?php echo $lists['image']; ?>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<script language="javascript" type="text/javascript">
						if (document.forms.adminForm.image.options.value!=''){
							jsimg='../<?echo $cparams->get('image_path'); ?>/' + getSelectedValue( 'adminForm', 'image' );
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
					echo $pane->startPane("menu-pane");
					echo $pane->startPanel(JText :: _('Contact Parameters'), "param-page");
					echo $params->render();
					echo $pane->endPanel();
					echo $pane->startPanel(JText :: _('Advanced Parameters'), "param-page");
					echo $params->render('params', 'advanced');
					echo $pane->endPanel();
					echo $pane->startPanel(JText :: _('E-mail Parameters'), "param-page");
					echo $params->render('params', 'email');
					echo $pane->endPanel();
					echo $pane->endPane();
				?></fieldset>
		</div>
		<div class="clr"></div>

		<input type="hidden" name="option" value="<?php echo $option; ?>" />
		<input type="hidden" name="id" value="<?php echo $row->id; ?>" />
		<input type="hidden" name="cid[]" value="<?php echo $row->id; ?>" />
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="catid" value="" />
		<input type="hidden" name="positionToDelete" value="" />
		<?php echo JHTML::_( 'form.token' ); ?>
		</form>
		<?php
	}
	
	/**
	 * Display interface for editing a contact.
	 * @param object [$contactSection] the information for the section which is
	 * being edited.
	 */
	function editContactSection( $contactSection = null )
	{
		if ( empty( $contactSection ) ) {
			$contactSection = new stdClass();
			$contactSection->id = 0;
			$contactSection->name = '';
		}
	
		JRequest::setVar( 'hidemainmenu', 1 );
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
								<input class="inputbox" type="text" name="name" id="section_name" size="60" maxlength="255" value="<?php echo $contactSection->name; ?>" />
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<?php echo JHTML::_( 'form.token' ); ?>
			<input type="hidden" name="id" value="<?php echo $contactSection->id; ?>" />
			<input type="hidden" name="task" value="" />
		</form>
		
		<?php
	}
}
