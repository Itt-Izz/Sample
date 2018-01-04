<?php
session_start();
//$auth_details = file_get_contents('php://input');
require_once 'dbconfig.php';

//$auth_data = json_decode($auth_details);

// check userdata from database 
$username = $_GET['username'];
$password = $_GET['password'];

$logQuery = $conn->prepare('select * from Admin where username = :username and password = :password');
$logQuery->bindParam(':username',$username);
$logQuery->bindParam(':password',$password);
$logQuery->execute();
$result = $logQuery->fetch();
$rows = $logQuery->rowCount();


if ($logQuery->rowCount() < 1 ){
    /**
     * login failed, return an error
     */
    // $error = [
    //    'message' => 'failed to authorize'
    // ];

    // echo json_encode($error);
    header("Location: ../../index.html?error");

}else{ 

    $_SESSION['username'] = $result['username'];
    // $response = [
    //     'message' => 'authorized',
    //     'session' => $_SESSION['username']
    //  ];

    //  echo json_encode($response);
    header("Location: ../home.php");
     
}