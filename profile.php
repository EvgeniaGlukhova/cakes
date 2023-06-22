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
                <div class="profile_name">
                    <div class="familia">
                        <h3>Фамилия</h3>
                        <?php echo $lname ?>
                        <h3>Имя</h3> 
                        <?php echo $fname ?>
                        <h3>Отчество</h3>
                        <?php echo $otch ?>
                        <button class="but" onclick="window.location.replace('auth.php?out=1')">Выйти</button>
                    </div>
                    <div class="profile_img">
                        <img class="pfp" src="<?php echo $pfp; ?>" alt="Profile Picture">  
                    </div>
                       
                </div>
            </div>    
        </div>
    </main>

    <?php include_once 'footer.php' ?>
</body>
</html>
