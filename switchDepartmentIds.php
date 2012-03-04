#!/usr/bin/php
<?php

$db = new mysqli( 'localhost', 'root', 'nlpstu66', 'sudjoomladev' );

if ( !$db ) {
	echo 'Cannot connect to db: ' . $db->error;
}

//select all the ids from the jos_directory_contact_positions table
$ids = getCategoryIds($db);
//for each id
while ( $row = $ids->fetch_object() ) {
	//select the category from jos_categories with the id that has the department id in the positions table
	$id = getOtherCategoryId( $db, $row->department_id );
	
	//update the id in the jos_directory_contact_positions table to be the id of the selected category
	updateId( $db, $row->department_id, $id );
}

function getCategoryIds($db) {
	$query = 'SELECT department_id FROM jos_directory_contact_positions';
	$result = $db->query( $query );
	return $result;
}

function getOtherCategoryId( $db, $id ) {
	$query = 'SELECT title FROM jos_categories WHERE id=' . $id;
	$result = $db->query( $query );
	$title = $result->fetch_object()->title;
	//select the id of the category that has the same title as the selected category but that is in the com_directory section
	$query = sprintf( 'SELECT id FROM jos_categories WHERE title="%s" AND section="com_directory"', $title );
	$result = $db->query( $query );
	return $result->fetch_object()->id;
}

function updateId( $db, $oldId, $newId ) {
	$query = sprintf( 'UPDATE jos_directory_contact_positions SET department_id=%d WHERE department_id=%d', $newId, $oldId );
	$db->query($query);
	echo $db->error;
}