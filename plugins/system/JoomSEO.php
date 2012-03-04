<?php
// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport('joomla.event.plugin');
jimport('joomla.error.profiler');

class plgSystemJoomSEO extends jPlugin {
	// mainframe JApplication obj
	// I kept calling it so decided to put it here for simplicity
	var $mainframe;

	// document object
	var $document = null;

	// profiler for performance testing
	var $profiler = null;

	// local cache object in an attempt to increase performance
	var $cache = null;
	
	var $seoDoc = array();

	var $metaGenerator = 'JoomSEO by Phill Brown (http://www.joomseo.com)';

	var $params = null;
	
	var $enabled = true;
	
	/**
	 * Holds the content buffer
	 * includes all content / components
	 *
	 * @var string
	 */
	var $buffer;
	
	// performance counter to store the time taken for JoomSEO to generate and update the document
	var $perfCounter = '';
	
	// constructor
	function plgSystemJoomSEO(&$subject, $params) {
    	global $mainframe;
    	
    	// get plugin parameters
        $this->params = new JParameter($params);
    	
        // get mainframe
    	$this->mainframe =& $mainframe;
    	
    	// get document
    	$this->document =& JFactory::getDocument();

        // start our performance profiling
		$this->profiler = new JProfiler();
		
		// start our cache obj
		$this->cache = JFactory::getCache();
		// force enable our cache whether is is enabled or not
		$this->cache->setCaching(1);
		
		// call our base constructor
        parent::__construct($subject, $params);
    }

    
    // after dispatch event called by joomla
    // this is before OnAfterRender so we can mod the document before rendering
    function OnAfterDispatch() {
    	// we only want to do the site, not admin or install
    	if (!$this->mainframe->isSite()) return ;
    	// we only want to display on html documents
	    if ($this->document->getType() != 'html') return ;
	    // we do not want to run if user is editing content
    	if ($this->IsEdit()) return ;
    	
    	// check if buffer has any {joomseo} bot codes and process
    	$this->botProcessor();
    	
    	// only continue if enabled
    	if (!$this->enabled) return ;
    	
    	$user = JFactory::getUser();
    	//if ($user->username == 'admin') {
    		
    		
	    	// we only want to do the site, not admin or install
	    	if (!$this->mainframe->isSite()) return ;
	    	// we only want to mod html documents
	    	if ($this->document->getType() != 'html') return ;
			if (($this->params->get('frontpageEnabled') == 0) && ($this->IsFrontPage())) return ;
	    	
	    	// do our generator
	    	$this->doGenerator();

	    	//print_r($this->seoDoc);
	
	    	// update our document
	    	$this->updateDocument();
	
	    	// save our vars for later module use (tag cloud etc)
	    	$this->saveVars();
		    	
    		// get our final performance figure from creation of this obj to completion of JoomSEO
			$this->perfCounter = $this->profiler->mark('');
    		//echo $this->perfCounter;
    	//}
    }
    
    function botProcessor() {
    	// $keepcodes: if for some reason we do not want to remove the bot codes (such as explaing the use in a web page)
    	$keepcodes = false;
    	// define the regular expression for the bot
		$regex = '/{joomseo\s*(.*?)}/i';
	 	// find all instances of plugin and put in $matches
		preg_match_all($regex, current($this->document->_buffer['component']), $matches);
		
		// Number of plugins
 		$count = count($matches[0]);
 		if ($count) {
			// loop through all our matches
			for ($cnt = 0; $cnt < $count; $cnt++) {
				$action = str_replace ('joomseo', '', $matches[0][$cnt]);
				$action = str_replace( '{', '', $action );
				$action = str_replace( '}', '', $action );
				$action = trim($action);
				
				echo $action;
				switch ($action) {
					case '=off':
						$this->enabled = false;
						break;
					case '=keepcodes':
						$keepcodes = true;
						break;
				}
			}
			// remove bot codes from buffer
			$this->document->_buffer['component'] = preg_replace($regex, '', $this->document->_buffer['component']);
 		}
	}

    /**
     * Generate and set our class vars for our 
     * Title
     * MetaKeywords
     * MetaDescription
     */
    function doGenerator() {
    	// get our site name
    	$this->seoDoc['siteName'] = $this->getSiteName();
    	
    	// get our buffer text
    	$this->buffer = current($this->document->_buffer['component']);

    	// clean our text
    	$this->buffer = $this->CleanText($this->buffer);
    	

    	// check that we actually have some text to use
    	if ($this->buffer == '') return ;

    	// get our keyword array
    	$this->seoDoc['keywords'] = $this->GetKeywords(
    		$this->buffer,
    		$this->params->get('keywordMinCharacters'),
    		$this->params->get('stickyWords'),
    		$this->params->get('badWords'),
    		$this->params->get('badCharacters')
    	);

    	// update our meta keywords
    	$this->seoDoc['metaKeywords'] = $this->GlueItems(array_slice($this->seoDoc['keywords'], 0, $this->params->get('metaKeywordsCount')));

    	// if we are allowed to show title keywords
    	if ($this->params->get('showTitleKeywords')) {
	    	// update our title keywords
	    	$this->seoDoc['titleKeywords'] = $this->GlueItems(array_slice($this->seoDoc['keywords'], 0, $this->params->get('titleKeywordCount')));
    	}

    	// set our description
    	$this->seoDoc['metaDescription'] = $this->GetDescription($this->buffer, $this->params->get('metaDescriptionMinLength'), $this->params->get('metaDescriptionMaxLength'));

    	// get our heading - paragraph
    	if ($this->params->get('showContentHeading')) {
    		$this->seoDoc['componentHeading'] = $this->document->title;
    	}

    	if ($this->params->get('showFirstParagraph')) {
    		$this->contentParagraph = $this->getFirstParagraph();
    	}

    	// get our title
    	$this->seoDoc['title'] = $this->generateTitle();
    }

    
    /**
     * Updates our html document
     * If an option is disabled then the joomla default will be used instead
     *
     */
    function updateDocument() {

    	// check if we are on the front page
    	if ($this->IsFrontPage()) {
    		// set our title if not disabled
    		if (!$this->params->get('disableFrontpageTitle')) {
				if($this->params->get('overrideFrontPageTitle') != '') {
					$this->seoDoc['title'] = $this->params->get('overrideFrontPageTitle');
				}
				$this->document->setTitle($this->seoDoc['title']);
    		}
    		// set our meta keywords if not disabled
    		if (!$this->params->get('disableFrontpageKeywords')) {
				if($this->params->get('overrideFrontPageKeywords') != '') {
					$this->seoDoc['metaKeywords'] = $this->params->get('overrideFrontPageKeywords');
				}
    			$this->document->setMetaData('keywords', $this->seoDoc['metaKeywords']);
    		}
    		// set our meta description if not disabled
    		if (!$this->params->get('disableFrontpageDescription')) {
				if($this->params->get('overrideFrontPageDescription') != '') {
					$this->seoDoc['metaDescription'] = $this->params->get('overrideFrontPageDescription');
				}
    			$this->document->setDescription($this->seoDoc['metaDescription']);
    		}
    	} else {
	    	// set our title tag
	    	$this->document->setTitle($this->seoDoc['title']);
	    	// set our keywords
			$this->document->setMetaData('keywords', $this->seoDoc['metaKeywords']);
	    	// set our description tag
	    	$this->document->setDescription($this->seoDoc['metaDescription']);
    	}
    	// add our generator tag
    	// please leave this here as this will not affect SEO and is little to ask for a free product and my time
    	if ($this->params->get('showGenerator')) {
			$this->document->setMetaData('generator', $this->metaGenerator);
    	}
    }
    
    // saves some vars for future module or template use
    // in the module simly call using
    // global $mainframe
    // $var = $mainframe->get('joomseo.keywords');
    function saveVars() {
    	$this->mainframe->set('joomseo', $this->seoDoc);
    }

    function generateTitle() {
    	// create our title array
		$titleItems = array();
		// add our pre pended title
		$this->Push($titleItems, $this->params->get('prependTitle'));

		// set our sort order
		switch ($this->params->get('titleOrder')) {
			case 3://<option value="1">Site Name | Heading-Paragraph | Keywords</option>
				$this->Push($titleItems, $this->seoDoc['siteName']);
				if ($this->seoDoc['componentHeading'] != null) {
					$this->Push($titleItems, ($this->contentParagraph) ? $this->seoDoc['componentHeading'] ." - ". $this->contentParagraph : $this->seoDoc['componentHeading']);
				} else {
					$this->Push($titleItems, $this->contentParagraph);
				}
				$this->Push($titleItems, $this->seoDoc['titleKeywords']);
				break;
			case 4://<option value="2">Site Name | Keywords | Heading-Paragraph</option>
				$this->Push($titleItems, $this->seoDoc['siteName']);
				$this->Push($titleItems, $this->seoDoc['titleKeywords']);
				if ($this->seoDoc['componentHeading'] != null) {
					$this->Push($titleItems, ($this->contentParagraph) ? $this->seoDoc['componentHeading'] ." - ". $this->contentParagraph : $this->seoDoc['componentHeading']);
				} else {
					$this->Push($titleItems, $this->contentParagraph);
				}
				break;
			case 1://<option value="3">Heading-Paragraph | Site Name | Keywords</option>
				if ($this->seoDoc['componentHeading'] != null) {
					$this->Push($titleItems, ($this->contentParagraph) ? $this->seoDoc['componentHeading'] ." - ". $this->contentParagraph : $this->seoDoc['componentHeading']);
				} else {
					$this->Push($titleItems, $this->contentParagraph);
				}
				$this->Push($titleItems, $this->seoDoc['siteName']);
				$this->Push($titleItems, $this->seoDoc['titleKeywords']);
				break;
			case 2://<option value="4">Heading-Paragraph | Keywords | Site Name</option>
				if ($this->seoDoc['componentHeading'] != null) {
					$this->Push($titleItems, ($this->contentParagraph) ? $this->seoDoc['componentHeading'] ." - ". $this->contentParagraph : $this->seoDoc['componentHeading']);
				} else {
					$this->Push($titleItems, $this->contentParagraph);
				}
				$this->Push($titleItems, $this->seoDoc['titleKeywords']);
				$this->Push($titleItems, $this->seoDoc['siteName']);
				break;
			case 5://<option value="5">Keywords | Site Name | Heading-Paragraph</option>
				$this->Push($titleItems, $this->seoDoc['titleKeywords']);
				$this->Push($titleItems, $this->seoDoc['siteName']);
				if ($this->seoDoc['componentHeading'] != null) {
					$this->Push($titleItems, ($this->contentParagraph) ? $this->seoDoc['componentHeading'] ." - ". $this->contentParagraph : $this->seoDoc['componentHeading']);
				} else {
					$this->Push($titleItems, $this->contentParagraph);
				}
				break;
			case 6://<option value="6">Keywords | Heading-Paragraph | Site Name</option>
				$this->Push($titleItems, $this->seoDoc['titleKeywords']);
				if ($this->seoDoc['componentHeading'] != null) {
					$this->Push($titleItems, ($this->contentParagraph) ? $this->seoDoc['componentHeading'] ." - ". $this->contentParagraph : $this->seoDoc['componentHeading']);
				} else {
					$this->Push($titleItems, $this->contentParagraph);
				}
				$this->Push($titleItems, $this->seoDoc['siteName']);
				break;
		}

		// add our appended title
		$this->Push($titleItems, $this->params->get('appendTitle'));

		// return our array of items
		if ($this->params->get('titleLength')) {
			return substr(implode(' | ', $titleItems),0,$this->params->get('titleLength'));
		} else {
			return implode(' | ', $titleItems);
		}
    }

    /**
	 * Gets the description for the meta description tag
	 * uses the sentence inside $minLength and $maxLength
	 * or sentence... if sentence is bigger than $maxLength
	 *
	 * @param string $text
	 * @param int $minLength
	 * @param int $maxLength
	 * @return string
	 */
	function GetDescription($text, $minLength = 100, $maxLength = 250) {
		if ($minLength > $maxLength) return;
		if (!$text) return;
		
		// previously sentences including 'Joomla 1.0' was stopping at "Joomla 1." therefor the philosophy has changed here.
		// we want a minumim of $minLength chars and a max of $maxLength chars, stopping at a sentence inbetween.
		// get pos of '.'
		$stop = strpos($text,'.');
		if (($stop >= $minLength) && ($stop <= $maxLength)) {
			// display the full sentence as it is
			$desc = trim(substr($text,0,$stop + 1));
		} else {
			// display the sentence cut short
			$desc = trim(substr($text, 0, $maxLength -3))."...";
		}
		
		return ucfirst($desc);
	}

	
	/**
	 * Returns an array of key=>value
	 * keywordCount=>keyword
	 *
	 * @param unknown_type $text
	 * @param unknown_type $minLength
	 * @param unknown_type $stickyWords
	 * @param unknown_type $badWords
	 * @param unknown_type $badCharacters
	 * @return unknown
	 */
	function GetKeywords($text, $minLength, $stickyWords = null, $badWords = null, $badCharacters = null) {
		$text = strtolower($text);
		
		// remove any email addresses
		$regex = '/(([_A-Za-z0-9-]+)(\\.[_A-Za-z0-9-]+)*@([A-Za-z0-9-]+)(\\.[A-Za-z0-9-]+)*)/iex';
		$replacement = '';
		$text = preg_replace($regex, $replacement, $text);

		// remove any unwanted characters
	    $badCharacters = explode(' ', $badCharacters);
		foreach ($badCharacters as $badChar) {
			$text = str_replace ($badChar, null, $text);
	    }

		// remove any unwanted words
		$badWords = explode(' ',$badWords);
		$firstWord = substr($text, 0, (strpos($text, " ")) +1);
		$lastWord = substr($text , strrpos($text, " "));
		foreach ($badWords as $badWord) {
			// remove all instances at the beginning
			if (strcasecmp("$badWord ",$firstWord) == 0) {
				$text = substr($text, strlen($firstWord));
			}
			
			// remove all instances in the middle
			$text = preg_replace("/ $badWord /i", ' ', $text);
			
			// remove all instances at the end
			if (strcasecmp(" $badWord", $lastWord) == 0) {
				$text = substr($text, 0, strlen($text) - strlen($lastWord));
			}
	    }
		
	    // capitalise our text
		$text = ucwords($text);
		$stickyWords = ucwords($stickyWords);

		$wordCount = array();
		// add our stickywords
		$stickyWords = explode(' ',$stickyWords);
		foreach ($stickyWords as $stickyWord) {
			$wordCount[$stickyWord]=1;
	    }
		
	    // loop through all our words and count instances
	    $words = explode(' ',$text);
		foreach ($words as $word) {
			$word = trim($word);
			// after all checking was still getting null chars from somewhere
			if (($word != null) && (strlen($word) >= $minLength)) {
				// check that word already has been added
				if (array_key_exists($word, $wordCount)) {
					// it does so add to our count
					$wordCount[$word] += 1;
				} else {
					// it doesnt so put it in once
					$wordCount[$word] = 1;
				}
			}
		}
	    
		// sort the new word array
		@arsort($wordCount);
		
		return $wordCount;
	}

	/**
	 * Checks if current page is Joomla front page
	 *
	 * @return bool
	 */
	function IsFrontPage() {
		global $Itemid;
		
		// get the first menu item in mainmenu as this is the front page in joomla
		$db = JFactory::getDBO();
		$query = "SELECT * from #__menu WHERE home = '1' ORDER BY ordering LIMIT 1";
		$db->setQuery($query);
		$id = $db->loadResult();

		if ($Itemid == $id) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * Returns true if a content item is being edited
	 *
	 * @return bool, true on editing
	 */
	function IsEdit() {
		if (JRequest::getString('task') == 'edit') {
			return true;
		}
	}
	
	/**
	 * Returns either the actual site name or the overridden site name
	 *
	 * @return unknown
	 */
	function getSiteName() {
		$siteName = '';
		// get our sitename
		if ($this->params->get('showTitleSiteName')) {
			$siteName = $this->mainframe->getCfg('sitename');
		}
		return $siteName;
	}
	
	function getFirstParagraph() {
		if ($this->params->get('showFirstParagraph')) {
			return $this->GetDescription($this->buffer, $this->params->get('paragraphMinLength'), $this->params->get('paragraphLength'));
		}
	}

    /**
	 * Get a string of formatted keywords
	 *
	 * @param array key=>value $items
	 * @return string
	 */
	function GlueItems($items) {
		// as format is in a $key=>$value pair extract the keys
		$keys = array_keys($items);
		// glue our array into a single string
		$ret = implode(', ', $keys);
		return $ret;
	}

    /**
	 * Clean and prepare text, remove any unwanted tags etc
	 *
	 * @param string $text
	 * @return string
	 */
	function CleanText($text) {
		// remove any javascript - OLLY
		// http://forum.joomla.org/index.php?topic=194800.msg1036857
		$regex = "'<script[^>]*?>.*?</script>'si";
		$text = preg_replace($regex, " ", $text);
		$regex = "'<noscript[^>]*?>.*?</noscript>'si";
		$text = preg_replace($regex, " ", $text);
   
		// convert html entities to chars
		// this doesnt remove &nbsp; but converts it to ascii 160
		// we handle that further down changing chr(160) to a space
		$text = html_entity_decode($text);
		
		// strip any remaining html tags
		$text = strip_tags($text);
		
		// remove any mambot codes
		$regex = '(\{.*?\})';
		$text = preg_replace($regex, " ", $text);
		
		// convert newlines and tabs to spaces
		$text = str_replace(array("\r\n", "\r", "\n", "\t", chr(160)), " ", $text);
		
		// remove any extra spaces
		while (strchr($text,"  ")) {
			$text = str_replace("  ", " ",$text);
		}
		
		// general sentence tidyup
		for ($cnt = 1; $cnt < strlen($text); $cnt++) {
			// add a space after any full stops or comma's for readability
			// added as strip_tags was often leaving no spaces
			if (($text{$cnt} == '.') || ($text{$cnt} == ',')) {
				if ($text{$cnt+1} != ' ') {
					$text = substr_replace($text, ' ', $cnt + 1, 0);
				}
			}
		}
		
		return trim($text);
	}

	/**
	 * Add an item to our array
	 *
	 * @param array $stack
	 * @param text $var
	 */
	function Push(&$stack, $var) {
		if ($var) array_push($stack, $var);
	}
}


?>