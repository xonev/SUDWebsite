<?php
/**
 * @version $Id$
 * @package 
 * @subpackage
 */

$db = new mysqli( 'localhost', 'root', 'nlpstu66', 'joomla' );
if ( !$db ) {
	echo "Cannot connect: " . $db->error;
}

$states = array( 'Andhra Pradesh',
   'Arunachal Pradesh',
   'Assam',
   'Bihar',
   'Chhattisgarh',
   'Goa',
   'Gujarat',
   'Haryana',
   'Himachal Pradesh',
   'Jammu and Kashmir',
   'Jharkhand',
   'Karnataka',
   'Kerala',
   'Madhya Pradesh',
   'Maharashtra',
   'Manipur',
   'Meghalaya',
   'Mizoram',
   'Nagaland',
   'Orissa',
   'Punjab',
   'Rajasthan',
   'Sikkim',
   'Tamil Nadu',
   'Tripura',
   'Uttar Pradesh',
   'Uttarakhand',
   'West Bengal');

foreach ($states as $state) {
	insertState($state, $db);
}

function insertState($state, $db) {
	$query = 'INSERT INTO `jos_states` ( `id`, `name` ) VALUES (NULL, "' . $state . '")';
	$db->query($query);
	echo $db->error . '<br>';
}
