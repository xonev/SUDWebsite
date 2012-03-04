<?php defined('_JEXEC') or die('Restricted access');

$currentFolder = '';
if (isset($this->state->folder) && $this->state->folder != '') {
	$currentFolder = $this->state->folder;
}
// SEF problem
$isThereQM = false;
$isThereQM = preg_match("/\?/i", $this->tmpl['action']);
if ($isThereQM) {
	$amp = '&amp;';
} else {
	$amp = '?';
}
?><div id="phocagallery-upload">
	<div style="font-size:1px;height:1px;margin:0px;padding:0px;">&nbsp;</div>
	<fieldset>
		<legend><?php echo JText::_( 'Upload File' ); ?> [ <?php echo JText::_( 'Max' ); ?>&nbsp;<?php echo ($this->tmpl['uploadmaxsize'] / 1000000); ?>M ]</legend>
		
		
		<form onsubmit="return OnUploadSubmit();" action="<?php echo $this->tmpl['action'] . $amp ?>task=upload&amp;<?php echo $this->session->getName().'='.$this->session->getId(); ?>&amp;<?php echo JUtility::getToken();?>=1&amp;viewback=category" id="uploadForm" method="post" enctype="multipart/form-data">
		
		<table>
			<tr>
				<td><?php echo JText::_('Filename');?>:</td>
				<td>
				<input type="file" id="file-upload" name="Filedata" />
				<input type="submit" id="file-upload-submit" value="<?php echo JText::_('Start Upload'); ?>"/>
				<span id="upload-clear"></span>
				</td>
			</tr>
			
			<?php
			if ($this->tmpl['displaytitleupload'] == 1 || $this->tmpl['displaydescupload'] == 1) {
				if ($this->tmpl['displaytitleupload'] == 1) {
					?>
					<tr>
						<td><?php echo JText::_( 'Image Title' ); ?>:</td>
						<td>
							<input type="text" id="phocagallery-upload-title" name="phocagalleryuploadtitle" value=""  maxlength="255" class="comment-input" /></td>
					</tr>
					<?php
				}
				if ($this->tmpl['displaydescupload'] == 1) {
					?>
					<tr>
						<td><?php echo JText::_( 'Description' ); ?>:</td>
						<td><textarea id="phocagallery-upload-description" name="phocagalleryuploaddescription" onkeyup="countCharsUpload();" cols="30" rows="10" class="comment-input"></textarea></td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td><?php echo JText::_('Characters written');?> <input name="phocagalleryuploadcountin" value="0" readonly="readonly" class="comment-input2" /> <?php echo JText::_('and left for description');?> <input name="phocagalleryuploadcountleft" value="<?php echo $this->tmpl['maxuploadchar'];?>" readonly="readonly" class="comment-input2" />
						</td>
					</tr>
					<?php
				}
			}
			?>
		</table>	
			
		<ul class="upload-queue" id="upload-queue">
			<li style="display: none" ></li>
		</ul>

		<input type="hidden" name="tab" value="<?php echo $this->tmpl['currenttab']['upload'];?>" />
	</form>
	<div id="loading-label"><center><?php echo JHTML::_('image', 'components/com_phocagallery/assets/images/icon-switch.gif', '') . JText::_('Loading'); ?></center></div>
	
	</fieldset>
</div>
