<?php
defined('_JEXEC') or die('Restricted access'); 
if ($this->tmpl['phocagallerywidth'] != '') {
	echo '<div id="phocagallery" style="width:'. $this->tmpl['phocagallerywidth'].'px">';
} else {
	echo '<div id="phocagallery">';
}

if ( $this->params->def( 'show_page_title', 1 ) ) { ?>
	<div class="componentheading<?php echo $this->params->get( 'pageclass_sfx' ); ?>">
		<?php echo $this->params->get('page_title'); ?>
	</div>
<?php } ?>



<div class="contentpane<?php echo $this->params->get( 'pageclass_sfx' ); ?>">
<?php if ( ($this->params->def('image', -1) != -1) || $this->params->def('show_comp_description', 1) ) : ?>
	<div class="contentdescription<?php echo $this->params->get( 'pageclass_sfx' ); ?>">
	<?php
		if ( isset($this->tmpl['image']) ) :  echo $this->tmpl['image'] . '<div style="clear:both"></div>';  endif;
		echo $this->params->get('comp_description');
	?>
	</div>
<?php endif; ?>
</div>

<?php
$columns 			= (int)$this->tmpl['categoriescolumns'];
$countCategories 	= count($this->categories);
$begin				= array();
$end				= array();
$begin[0]			= 0;// first
$begin[1]			= ceil ($countCategories / $columns);
$end[0]				= $begin[1] -1;

for ( $j = 2; $j < $columns; $j++ ) {
	$begin[$j]	= ceil(($countCategories / $columns) * $j);
	$end[$j-1]	= $begin[$j] - 1;
}
$end[$j-1]		= $countCategories - 1;// last
$endFloat		= $countCategories - 1;

// -------------------
// TABLE LAYOUT
// -------------------
if ($this->tmpl['displayimagecategories'] == 1) {	
	for ($i = 0; $i < $countCategories; $i++) {
		if ( $columns == 1 ) {
			echo '<table>';
		} else {
			$float = 0;
			foreach ($begin as $k => $v)
			{
				if ($i == $v) {
					$float = 1;
				}
			}
			if ($float == 1) {		
				echo '<div style="position:relative;float:left;margin:10px;"><table>';
			}
		}

		echo '<tr>';		
		echo '<td align="center" valign="middle" style="'.$this->tmpl['imagebg'].';text-align:center;"><a href="'.$this->categories[$i]->link.'">'.JHTML::_( 'image.site', $this->categories[$i]->linkthumbnailpath, '', '', '', $this->categories[$i]->title, 'style="border:0"' ).'</a></td>';
		echo '<td><a href="'.$this->categories[$i]->link.'" class="category'.$this->params->get( 'pageclass_sfx' ).'">'.$this->categories[$i]->title.'</a>&nbsp;';
		
		if ($this->categories[$i]->numlinks > 0) {echo '<span class="small">('.$this->categories[$i]->numlinks.')</span>';}
		
		echo '</td>';
		echo '</tr>';
		
		if ( $columns == 1 ) {
			echo '</table>';
		} else {
			if ($i == $endFloat) {
				echo '</table></div><div style="clear:both"></div>';
			} else {
				$float = 0;
				foreach ($end as $k => $v)
				{
					if ($i == $v) {
						$float = 1;
					}
				}
				if ($float == 1) {		
					echo '</table></div>';
				}
			}
		}
	}
} 
// -------------------
// DETAIL LAYOUT
// -------------------

else if ($this->tmpl['displayimagecategories'] == 2){
	
	echo '<div id="phocagallery-categories-detail">';
	for ($i = 0; $i < $countCategories; $i++) {
		echo '<fieldset>'
			.' <legend>'
			.'  <a href="'.$this->categories[$i]->link.'" class="category'.$this->params->get( 'pageclass_sfx' ).'">'.$this->categories[$i]->title_self.'</a> ';
			
		if ($this->categories[$i]->numlinks > 0) {
			echo '<span class="small">('.$this->categories[$i]->numlinks.')</span>';
		}	
			
		echo ' </legend>';
		
		echo '<div style="padding:0;margin:0;margin-top:10px;margin-bottom:5px">'
		    .'<div style="position:relative;float:left;margin:0;padding:0">'
		    .' <table border="0" cellpading="0" cellspacing="0">'
			.'  <tr>'
		    .'   <td style="'.$this->tmpl['imagebg'].';text-align:center;"><a href="'.$this->categories[$i]->link.'">'.JHTML::_( 'image.site', $this->categories[$i]->linkthumbnailpath, '', '', '', $this->categories[$i]->title, 'style="border:0"' ).'</a></td>'
			.'  </tr>'
			.' </table>'
			.'</div>';
		
		
		echo '<div style="margin-right:5px;margin-left:'.$this->tmpl['imagewidth'].'px;">';
		if ($this->categories[$i]->description != '') {
		   echo '<div>'.$this->categories[$i]->description.'</div><p>&nbsp;</p>';
		}
		echo '<table border="0" cellpading="0" cellspacing="0" >';
		if ( $this->categories[$i]->username != '') {
			echo '<tr><td>'.JText::_('Author') .': </td>'
			    .'<td>'.$this->categories[$i]->username.'</td></tr>';
		}
		
		echo '<tr><td>'.JText::_('Number of images in category') .': </td>'
		.'<td>'.$this->categories[$i]->numlinks.'</td></tr>'
		.'<tr><td>'.JText::_('Category viewed') .': </td>'
		.'<td>'.$this->categories[$i]->hits.' x</td></tr>';

		// Rating
		$votesCount = 0;
		$votesAverage = 0;
		$votesWidth = 0;
		if (!empty($this->categories[$i]->ratingcount)) {
			$votesCount = $this->categories[$i]->ratingcount;
		}
		if (!empty($this->categories[$i]->ratingaverage)) {
			$votesAverage = $this->categories[$i]->ratingaverage;
			if ($votesAverage > 0) {
				$votesAverage 	= round(((float)$votesAverage / 0.5)) * 0.5;
				$votesWidth		= 22 * $votesAverage;
			}
			
		}
		if ((int)$votesCount > 1) {
			$votesText = 'votes';
		} else {
			$votesText = 'vote';
		}
		
		echo '<tr><td>' . JText::_('Rating'). ': </td>'
		    .'<td>' . $votesAverage .' / '.$votesCount . ' ' . JText::_($votesText). '</td></tr>'
			.'<tr><td>&nbsp;</td>'
			.'<td>'
		    .' <ul class="star-rating">'
			.'  <li class="current-rating" style="width:'.$votesWidth.'px"></li>'
			.'   <li><span class="star1"></span></li>';
		for ($r = 2;$r < 6;$r++) {
			echo '<li><span class="stars'.$r.'"></span></li>';
		}
		echo '</ul>'
		     .'</td>'
		     .'</tr>'
			 .'</table>'
			 .'</div>'
		     .'<div style="clear:both;"></div>'
			 .'</div>'
		     .'</fieldset>';
	}
	echo '</div>';

	

}

// -------------------
// UL LAYOUT
// -------------------
else {
	for ($i = 0; $i < $countCategories; $i++)
	{
		if ( $columns == 1 ) {
			echo '<ul>';
		} else {
			$float = 0;
			foreach ($begin as $k => $v)
			{
				if ($i == $v) {
					$float = 1;
				}
			}
			if ($float == 1) {		
				echo '<div style="position:relative;float:left;margin:10px"><ul>';
			}
		}
		
		echo '<li><a href="'.$this->categories[$i]->link.'" class="category'.$this->params->get( 'pageclass_sfx' ).'">'.$this->categories[$i]->title.'</a>&nbsp;';
		
		if ($this->categories[$i]->numlinks > 0) {echo '<span class="small">('.$this->categories[$i]->numlinks.')</span>';}
		
		echo '</li>';
		
		if ( $columns == 1 ) {
			echo '</ul>';
		} else {
			if ($i == $endFloat) {
				echo '</ul></div><div style="clear:both"></div>';
			} else {
				$float = 0;
				foreach ($end as $k => $v)
				{
					if ($i == $v) {
						$float = 1;
					}
				}
				if ($float == 1) {		
					echo '</ul></div>';
				}
			}
		}
	}
}
echo $this->tmpl['phocainfocode'];?>
</div>