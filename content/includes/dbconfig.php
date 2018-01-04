<?php

$servername = 'localhost';
$username = 'root';
$password = '';
$dbname = 'dmclient';

try {
	$conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	// successfully connected

} catch (PDOException $e) {

	// an error occured
	echo "Error occured " . $e->getMessage();
}
?>