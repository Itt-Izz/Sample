<?php
/**
 * 
 * This file accepts requests and services them, giving data response in json
 * @param $requestVar->type 
 * 
 */
require_once 'dbconfig.php';

$requestVar = json_decode(file_get_contents('php://input'));


/**
 * `respondData($conn,$sql)` .
 *  a blue print for database query
 *  @param $conn, $sql
 *      - $conn -> database connection
 *      - $sql -> mysql query statement
 */
function respondData($conn, $sql){
    $res = $conn->query($sql);
    $resArray = [];
    while($rows = $res->fetch()){
        array_push($resArray, $rows);
    }
    return json_encode($resArray);
}

// check type of request and respond appropriately
if($requestVar->type == 'all_books'){
    // do a database fetch request for all the existing books
    $sql = 'select Books.*, Category.name as cname from Books left join Category on Books.cat_id = Category.id';
    echo respondData($conn,$sql);
}
if($requestVar->type == 'most_ordered'){
    // do a database fetch for the most ordered books of all time
    $sql = 'select count(book_id) id,Books.name as name , Category.name as cname from Orders inner join Books on Orders.book_id = Books.id inner join
    Category on Books.cat_id = Category.id group by book_id order by id desc';
    echo respondData($conn,$sql);
}
if($requestVar->type == 'pending'){
    // do a database fetcg request for all the pending orders
    $sql = 'select Orders.*,Books.name as name,Category.name as cname from Orders left join Books on Books.id = Orders.book_id inner join Category on Books.cat_id=Category.id';
    echo respondData($conn,$sql);
}
if($requestVar->type == 'curr_orders'){
    // do a database fetch request for all orders submitted today
    $sql = 'select Orders.*, Books.name as name,Category.name as cname from Orders left join Books on Orders.book_id = Books.id inner join Category on Books.cat_id=Category.id where DATE(order_date) = CURDATE()';
    echo respondData($conn,$sql);
}
if($requestVar->type == 'previous_month'){
    // do a database fetch request for orders submitted in the last 30 days
    $sql = 'select Orders.*,Books.name name, Category.name as cname from Orders left join Books on Orders.book_id = Books.id inner join Category on Books.cat_id=Category.id where DATE(order_date) >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)';
    echo respondData($conn,$sql);
}
