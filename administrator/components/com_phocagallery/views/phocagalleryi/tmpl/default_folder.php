<?php defined('_JEXEC') or die('Restricted access'); ?>

<div class="phocagallery-box-file-i">
	<center>
		<div class="phocagallery-box-file-first-i">
			<div class="phocagallery-box-file-second">
				<div class="phocagallery-box-file-third">
					<center>
					<a href="index.php?option=com_phocagallery&amp;view=phocagalleryi&amp;tmpl=component&amp;folder=<?php echo $this->_tmp_folder->path_with_name_relative_no; ?>"><?php echo JHTML::_( 'image.administrator', 'components/com_phocagallery/assets/images/icon-folder-images.gif', ''); ?></a>
					</center>
				</div>
			</div>
		</div>
	</center>
	
	<div class="name"><a href="index.php?option=com_phocagallery&amp;view=phocagalleryi&amp;tmpl=component&amp;folder=<?php echo $this->_tmp_folder->path_with_name_relative_no; ?>"><span><?php echo PhocagalleryHelper::WordDelete($this->_tmp_folder->name,15); ?></span></a></div>
		<div class="detail" style="text-align:right">&nbsp;</div>
	<div style="clear:both"></div>
</div>
