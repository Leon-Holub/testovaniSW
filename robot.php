<!doctype html>
<?php
//error_reporting(E_ERROR | E_PARSE);
require_once("functions.php");
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Robot soubor</title>
    <link rel="stylesheet" href="styles/styles-front.css">

</head>
<body class="bg-dark text-light">
<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <?php
            echo "<a class='btn btn-outline-primary px-3 mb-4' href='" . $_SERVER['HTTP_REFERER'] . "'><<span class='ms-2'>Zpět</span></a>";
            echo "<h1>" . basename($_GET["file"]) . "</h1>";
            testManager::printFile($_GET["file"]);
            ?>
        </div>
    </div>
</div>

</body>
</html>

