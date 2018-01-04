<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Scenarios Book Store | Manage Orders</title>
    <link rel="stylesheet" href="../css/custom.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialdesignicons.css">

    <style>
    li:nth-child(even){
        background-color: rgba(0,0,0,0.1);
    }
    </style>
</head>
<body>
    <nav class="nav navbar navbar-light bg-faded">
        <div class="container">
            <a href="javascript:void(0)" class="navbar-brand">Scenarios Book Store</a>
            <div class="float-right">
                <span class="text-info mr-4">
                    <?php
                    echo $_SESSION['username']
                    ?>
                </span>
                <a class="btn btn-sm btn-outline-danger" href="includes/logout.php">
                    <span class="mdi mdi-logout"></span>
                </a>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row my-5">
            <div class="col-12 mb-5">
                <h5>As the administrator of Scenarios Book Store, you can view orders, and / or view books.</h5>
            </div>
           <div class="col-6">
               <h6>Books section</h6>
               <div class="col-8">
                    <div class="card mt-2">
                        <div class="card-block">
                            <div>
                            <small class="text-muted">
                                View existing books
                            </small>
                            </div>
                            <button class="btn btn-sm btn-outline-info" id="all_books">View all books &nbsp;<span class="mdi mdi-history"></span></button>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <div class="card mt-2">
                        <div class="card-block">
                            <div>
                            <small class="text-muted">
                                View most ordered books
                            </small>
                            </div>
                            <button class="btn btn-sm btn-outline-danger" id="most_ordered">View most ordered &nbsp;<span class="mdi mdi-autorenew"></span> </button>
                        </div>
                    </div>
                </div>
           </div>
           <div class="col-6">
               <h6>Orders sections</h6>
               <div class="col-8">
                    <div class="card mt-2">
                        <div class="card-block">
                            <div>
                            <small class="text-muted">
                                View pending orders
                            </small>
                            </div>
                            <button class="btn btn-sm btn-outline-info" id="pending">View pending &nbsp;<span class="mdi mdi-history"></span></button>
                        </div>
                    </div>
                </div>

                <div class="col-8">
                    <div class="card mt-2">
                        <div class="card-block">
                            <div>
                            <small class="text-muted">
                                View today's orders
                            </small>
                            </div>
                            <button class="btn btn-sm btn-outline-success" id="curr_orders">View current orders &nbsp;<span class="mdi mdi-history"></span></button>
                        </div>
                    </div>
                </div>

                <div class="col-8">
                    <div class="card mt-2">
                        <div class="card-block">
                            <div>
                            <small class="text-muted">
                                View previous months orders
                            </small>
                            </div>
                            <button class="btn btn-sm btn-outline-primary" id="previous_month">View previous month &nbsp;<span class="mdi mdi-history"></span></button>
                        </div>
                    </div>
                </div>
           </div>
        </div>
    </div>

    <div class="cdialog d-none" id="modal_cont">
        <div class="modal-holder">
            <div class="modal-header">
                <h6 class="modal-title" id="title">Filtering data as requested</h6>
                <button type="button" class="close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body w-100" id="body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item w-100">
                        <div class="row w-100">
                            <div class="col-2">Code</div>
                            <div class="col-6">Name</div>
                            <div class="col-4">Category</div>
                        </div>
                    </li>
                </ul>
                <ul class="list-group list-group-flush w-100" id="disp">

                </li>
            </div>
        </div>
    </div>

    <script src="../js/request.js"></script>
</body>
</html>