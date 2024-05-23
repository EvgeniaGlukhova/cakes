<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>сайтик</title>
    <?php  include_once 'link.php' ?>
    <link rel="stylesheet" href="index.css">
</head>
<body>

<?php
session_start(["use_strict_mode" => true]);
include ("db.php");
include ("header.php");

if (isset($_GET['page'])) {
    switch ($_GET['page']) {
        case 'main':
            include "main.php";
            break;
        case 'register':
            include "register.php";
            break;
    }
} else {
    include "main.php";
    
}

include ("footer.php");
?>

</body>
