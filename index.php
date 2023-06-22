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

<?php include_once 'header.php' ?>

<main class="main">
    <div class="container">
        <article class="article_1">
            <div class="text">
                <h1>Добро пожаловать в cakes </h1>
                <button class="ooo" type="button">Сделать заказ</button>
            </div>
            <div class="image">
                <img src="img/m_торт_3_1.png" alt="picture_1" class="intro_img">
            </div>
        </article>
    </div>

    <div class="container">
        <section class="section">
            <div class="section_header">
                <h2>Каталог</h2>
            </div>
            <div class="section_catalog">
                <div class="cake">
                    <img class="cake_img" src="img/торт_1.png">
                    <h3>Чёрный лес</h3>
                    <button type="button" class="cake_btn">Заказать</button>
                </div>

                <div class="cake">
                    <img class="cake_img" src="img/торт_2_1.png">
                    <h3>Черемуховый</h3>
                    <button type="button" class="cake_btn">Заказать</button>
                </div>

                <div class="cake">
                    <img class="cake_img" src="img/торт_7.png">
                    <h3>Чизкейк</h3>
                    <button type="button" class="cake_btn">Заказать</button>
                </div>
            </div>
            <div>
                <button type="button" class="section_button">Смотреть всё</button>
            </div>
        </section>
    </div>

    <div class="container">
        <article class="article_2">
            <div class="article_header">
                <h1>Доставка и оплата</h1>
            </div>
            <div class="rectangle">
                <div class="rectangle_div">
                    <p>Доставка</p>
                    <P>Доставляем по Сургутскому району</P>
                </div>
                <div class="rectangle_div">
                    <P>Самовызов</P>
                    <P>адрес</P>
                </div>
                <div class="rectangle_div">
                    <P>Оплата</P>
                    <P>Оплата наличными или картой после доставки</P>
                </div>
            </div>
        </article>
    </div>
</main>

<?php include_once 'footer.php' ?>

</body>