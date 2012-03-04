<?php defined('_JEXEC') or die('Restricted access');
JHTML::_('behavior.tooltip'); 
$editor =& JFactory::getEditor();
?>
<script language="javascript" type="text/javascript">
	function submitbutton(pressbutton) {
		var form = document.adminForm;
		if (pressbutton == 'cancel') {
			submitform( pressbutton );
			return;
		}

		// do field validation
		/*if (form.title.value == ""){
			alert( "<?php echo JText::_( 'Gallery item must have a title', true ); ?>" );
		} else*/ if (form.catid.value == "0"){
			alert( "<?php echo JText::_( 'You must select a category', true ); ?>" );
		} else if (form.filename.value == ""){
			alert( "<?php echo JText::_( 'You must select a filename', true ); ?>" );
		} else {
			submitform( pressbutton );
		}
	}
</script>

<style type="text/css">
	table.paramlist td.paramlist_key {
		width: 92px;
		text-align: left;
		height: 30px;
	}
</style>


<form action="<?php echo $this->request_url; ?>" method="post" name="adminForm" id="adminForm">
<div class="col50">
	<fieldset class="adminform">
		<legend><?php echo JText::_( 'Details' ); ?></legend>

		<table class="admintable">
		<tr>
			<td width="100" align="right" class="key">
				<label for="title">
					<?php echo JText::_( 'Name' ); ?>:
				</label>
			</td>
			<td colspan="2">
				<input class="text_area" type="text" name="title" id="title" size="32" maxlength="250" value="<?php echo $this->phocagallery->title;?>" />
			</td>
		</tr>
		<tr>
			<td width="100" align="right" class="key">
				<label for="alias">
					<?php echo JText::_( 'Alias' ); ?>:
				</label>
			</td>
			<td>
				<input class="text_area" type="text" name="alias" id="alias" size="32" maxlength="250" value="<?php echo $this->phocagallery->alias;?>" />
			</td>
		</tr>
		<tr>
			<td valign="top" align="right" class="key">
				<?php echo JText::_( 'Published' ); ?>:
			</td>
			<td colspan="2">
				<?php echo $this->lists['published']; ?>
			</td>
		</tr>
		<tr>
			<td valign="top" align="right" class="key">
				<label for="catid">
					<?php echo JText::_( 'Category' ); ?>:
				</label>
			</td>
			<td colspan="2">
				<?php echo $this->lists['catid']; ?>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right" class="key">
				<label for="filename">
					<?php echo JText::_( 'Filename' ); ?>:
				</label>
			</td>
			<td valign="middle">
				<input class="text_area" type="text" name="filename" id="filename" value="<?php echo $this->phocagallery->filename; ?>" size="32" maxlength="250" />
			</td>
			<td align="left" valign="middle">
				<div class="button2-left" style="display:inline">
					<div class="<?php echo $this->button->name; ?>">
						<a class="<?php echo $this->button->modalname; ?>" title="<?php echo $this->button->text; ?>" href="<?php echo $this->button->link; ?>" rel="<?php echo $this->button->options; ?>"  ><?php echo $this->button->text; ?></a>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td valign="top" align="right" class="key">
				<label for="ordering">
					<?php echo JText::_( 'Ordering' ); ?>:
				</label>
			</td>
			<td colspan="2">
				<?php echo $this->lists['ordering']; ?>
			</td>
		</tr>
		
		<tr>
			<td valign="top" align="right" class="key">
				<label for="vmproductid">
					<?php echo JText::_( 'VM Product Id' ); ?>:
				</label>
			</td>
			<td>
				<input class="text_area" type="vmproductid" name="vmproductid" id="vmproductid" size="32" maxlength="10" value="<?php echo $this->vmproductid;?>" />
			</td>
		</tr>
		
		<tr>
			<td valign="top" align="right" class="key">
				<label for="videocode">
					<?php echo JText::_( 'Video Code' ); ?>:
				</label>
			</td>
			<td colspan="2">
				<textarea cols="46" rows="4" id="videocode" name="videocode"><?php echo $this->videocode ?></textarea>
			</td>
		</tr>
		
		<tr>
			<td class="key">
				<label for="title" width="100">
					<?php echo JText::_( 'Hits' ); ?>:
				</label>
			</td>
			<td colspan="2">
				<input class="text_area" type="text" name="hits" id="hits" value="<?php echo $this->phocagallery->hits; ?>" size="15" maxlength="11" title="<?php echo JText::_( 'Hits' ); ?>" />
			</td>
		</tr>
		
	</table>
	</fieldset>
	
	<fieldset class="adminform">
				<legend><?php echo JText::_( 'Description' ); ?></legend>

				<table class="admintable">
			<?php /*		<tr>
						<td valign="top" colspan="3">
							<textarea cols="60" rows="3" id="description" name="description"><?php echo $this->phocagallery->description ?></textarea>
						</td>
					</tr>*/ ?>
					
					<tr>
						<td valign="top" colspan="3">
							<?php
							// parameters : areaname, content, width, height, cols, rows, show xtd buttons
							echo $this->editor->display( 'description',  $this->phocagallery->description, '550', '300', '60', '20', array('pagebreak', 'readmore') ) ;
							?>
						</td>
					</tr>
					
					</table>
			</fieldset>
</div>

<div class="clr"></div>

<input type="hidden" name="cid[]" value="<?php echo $this->phocagallery->id; ?>" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="controller" value="phocagallery" />
</form>
