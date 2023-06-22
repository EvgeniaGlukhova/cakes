<?php
    session_start(["use_strict_mode" => true]);

    

    if (isset($_SESSION['login'])) {
        $text = $_SESSION['login'];
        $link = 'profile.php';
    } else {
        $text = 'Вход';
        $link = 'login.php';
    }
?>

<header class="header">
    <div class="container">
        <div class="header_inner">
            <div class="header_logo">
                <img src="img/кусок.png" class="header_img">
            </div>
            <nav class="nav">
                <a class="nav_link" href="#">Каталог</a>
                <a class="nav_link" href="index.php">Главная</a>
                <a class="nav_link" href="register.php">Регистрация</a>
            </nav>
            <a class="nav_link" href="<?php echo $link ?>"><?php echo $text ?></a>
        </div>
    </div>
</header>