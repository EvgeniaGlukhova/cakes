<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include_once 'link.php' ?>
    <link rel="stylesheet" href="profile.css">
    <title>Document</title>
</head>
<body>
    <?php include_once 'header.php' ?>

    <?php
    
    session_start(["use_strict_mode" => true]);
    require('db.php');

    $client_query = $db->query("SELECT * FROM cakes.\"Клиенты\" WHERE id_клиента = ".$_SESSION['client_id']); 

    $client_row = $client_query->fetch();
    $fname = $client_row['Имя'];
    
    $lname = $client_row['Фамилия '];

    $otch = $client_row['Отчество '];

    $user_query =  $db->query("SELECT * FROM cakes.\"Пользователь\" WHERE \"Логин\" = '".$_SESSION['login']."'");
    $user_row = $user_query->fetch();

    if ($user_row['Аватарка'] != 'NULL') {
        $pfp = 'data:image/png;base64,'.$user_row['Аватарка'];
    } else {
        $pfp = 'аватарка.png';
    }

    
    
    
    ?>

    <main class="main">
        <div class="main-container">
            <div class="profile">
                <div class="profile_img">
                    <img class="pfp" src="<?php echo $pfp; ?>" alt="Profile Picture">  
                </div>
                <div class="profile_name">
                    <div class="familia">
                        <h2>Фамилия</h2>
                        <?php echo $lname ?>

                    </div> 
                    <div class="name">
                        <h2>Имя</h2>
                        <?php echo $fname ?>


                    </div>
                    <div class="ot">
                        <h2>Отчество</h2>
                        <?php echo $otch ?>

                    </div>
                       
                </div>
            </div>    
        </div>
    </main>

    <?php include_once 'footer.php' ?>
</body>
</html>