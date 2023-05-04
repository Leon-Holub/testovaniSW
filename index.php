<!doctype html>
<?php

error_reporting(E_ERROR | E_PARSE);
require_once("functions.php");

$file = testManager::INDEX;
$automatized = isset($_GET["automatized"]);
$manual = isset($_GET["manual"]);

if (isset($_GET["name"])) {
    $file = $_GET["name"];
}


$manager = new testManager($file, $automatized, $manual);

$data = $manager->data;
$dirParents = $manager->getParents($file);
$dirParents = array_reverse($dirParents);
$testCases = $manager->getTestCases($file);
$testSets = $manager->getTestSets($file);


?>
<html lang="cz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Testování autobazaru <?php echo $data["ID"] ? " - " . $data["ID"] : ""; ?></title>
    <link rel="stylesheet" href="styles/styles-front.css">
    <style>
        .ts-after::after {
            background: #dc0d1b !important;
        }

        .card-body:hover svg {
            filter: invert();
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        li:first-letter {
            text-transform: uppercase;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg d-flex flex-column position-fixed top-0 w-100 pt-0 z-index-nav main-nav">
    <div class="container-fluid main-nav--top">
        <div class="container py-1">
            <div class="navbar-nav w-100 d-flex justify-content-around">
                <a class="nav-link" aria-current="page"><i class="fa-solid fa-envelope me-2"></i>Leon Holub</a>
            </div>
        </div>
    </div>

    <div class="container main-nav--bottom pt-1">
        <a class="navbar-brand" href="index.php">
            <img src="./images/logo-auto-drabek.png" alt="logo autobazaru">
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav d-lg-flex justify-content-around w-100">
                <a href="index.php" class="nav-link" aria-current="page">Domů</a>
                <a href="./index.php?manual=true" class="nav-link" aria-current="page">Manuální testy</a>
                <a href="./index.php?automatized=true" class="nav-link">Automatizované testy</a>

            </div>
        </div>
    </div>
</nav>
<section class="carsList-heading <?php if ($file == $manager::INDEX) echo "mb-0" ?>">
    <div class="carsList-heading--image carsList-heading--image--carsList">
        <img src="./images/hero-small.jpg" alt="hero-small">
        <div class="container carsList-heading--text position-absolute start-50 bottom-0 translate-middle-x d-flex justify-content-center">
            <h1 class="pb-4 <?php if ($data["Typ"] == "TS") echo "ts-after"; ?> "><?php echo $data["Název"] ?? "Testování autobazaru"; ?></h1>
        </div>
    </div>
</section>
<section class="carsList <?php if ($file == $manager::INDEX) echo "d-none" ?>">
    <div class="carsList-nav container">
        <span><a href="index.php" class="text-decoration-none text-secondary">Hlavní stránka </a>
                        <?php
                        if (count($dirParents) >= 0)
                            echo '<span class="mx-2">>></span>';
                        $i = 0;
                        foreach ($dirParents as $testFile) {
                            echo '<a href="./index.php?name=' . $testFile["path"] . '" class="text-decoration-none text-secondary">' . $testFile["Název"] . '</a>';
                            if ($i < count($dirParents))
                                echo '<span class="mx-2">>></span>';
                            $i++;
                        }
                        ?>
            <a class="text-decoration-none fw-bold text-secondary"><?php echo $data["Název"] ?></a></span>
    </div>


</section>
<section class="homepage-top-cars">
    <div class="container">
        <div class="row py-5">
            <div class="col-12 col-md-5 <?php if ($file == $manager::INDEX) echo "d-none" ?>">
                <div class="row justify-content-around">
                    <?php foreach ($data as $key => $val) {
                        if ($key == "Popis" || in_array($key, $manager->knownKeys))
                            continue;
                        ?>
                        <div class="col-12 col-lg-8">
                            <div class="row py-3 mx-2 border-bottom">
                                <div class="col-4 col-lg-3">
                                    <?php echo $key ?>
                                </div>
                                <div class="col-8 col-lg-9 text-end">
                                    <?php
                                    if ($key == "Typ") {
                                        echo $val == "TP" ? "Testovací případ" : "Testovací sada";
                                    } else
                                        echo $val
                                    ?>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <div class="col-12 col-lg-8">
                        <?php
                        if ($data["Typ"] == "TP" && count($data["Vstupní data"]) > 0) {
                            echo '<div class="col-12 mt-3">
                                <h3>Vstupní data</h3>
                                <table class="table table-striped table-hover">';

                            foreach ($data["Vstupní data"] as $input) {
                                $uprData = str_replace(["\$pathToImg", ".txt"], [substr($data["path"], 0, strripos($data["path"], "/")), ""], $input);
                                $uprdataArr = explode(" = ", $uprData);
                                echo "<tr><th>" . $uprdataArr[0] . "</th><td>" . $uprdataArr[1] . "</td></tr>";
                            }


                            echo '</table></div>';
                        }
                        if (isset($data["Automatizované"])) {
                            ?>
                            <h4 class="mt-4 mb-3 text-center"><a href="./robot.php?file=<?php echo $data["robot"] ?>">Robot soubor</a></h4>
                            <!--<iframe class="" width="100%" height="400" src="<?php echo $data["robot"] ?>"></iframe>-->
                            <div style="height: 400px; font-size: 12px; line-height: 1rem" class="bg-black text-white overflow-scroll "><?php  testManager::printFile($data["robot"]); ?></div>
                            <h4 class="mt-3 mb-0 text-center">Variables použité v TP</h4>
                            <p class="mt-0 text-center">(Vybané ze všech rodičovských TS)</p>
                            <?php  $manager->getParentsTS($data["robotTS"], $data["robot"]);//testManager::printFile($data["robotTS"]); ?>
                            <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
            <div class='col-12 col-md-7 <?php if ($file == $manager::INDEX) echo "d-none" ?>'>
                <div class="row">
                    <div class="col-12">
                        <h3>Popis</h3>
                        <p class='mt-2' style='text-align: justify'><?php echo $data['Popis'] ?></p>
                    </div>

                    <?php
                    if (isset($data["Pre-conditions"]) && count($data["Pre-conditions"]) > 0) {
                        echo '<div class="col-12">
                                <h3>Pre-conditions</h3>
                                <ul>';

                        foreach ($data["Pre-conditions"] as $precondition) {
                            echo "<li>$precondition</li>";
                        }


                        echo '</ul></div>';
                    }

                    if ($data["Typ"] == "TP") {
                        if (count($data["Testovací kroky"]) > 0) {
                            echo '<div class="col-12">
                                <h3>Testovací kroky</h3>
                                <ol>';

                            foreach ($data["Testovací kroky"] as $step) {
                                echo "<li>$step</li>";
                            }


                            echo '</ol></div>';
                        }
                    }

                    if (isset($data["Post-conditions"]) && count($data["Post-conditions"]) > 0) {
                        echo '<div class="col-12">
                                <h3>Post-conditions</h3>
                                <ul>';

                        foreach ($data["Post-conditions"] as $postcondition) {
                            echo "<li>$postcondition</li>";
                        }


                        echo '</ul></div>';
                    }

                    if ($data["Typ"] == "TP") {
                        if (count($data["Očekávaný výsledek"]) > 0) {
                            echo '<div class="col-12">
                                <h3>Očekávaný výsledek</h3>
                                <ul>';

                            foreach ($data["Očekávaný výsledek"] as $output) {
                                echo "<li>" . $output . "</li>";
                            }


                            echo '</ul></div>';
                        }
                        if (isset($data["Automatizované"])) {
                            ?>
                            <div class="col-12 mt-4">
                                <h3 class="position-relative">
                                    Automatizace
                                    <svg class="position-absolute end-0 top-0 mt-1 me-1" style="width: 30px"
                                         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                        <!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <path d="M320 0c17.7 0 32 14.3 32 32V96H472c39.8 0 72 32.2 72 72V440c0 39.8-32.2 72-72 72H168c-39.8 0-72-32.2-72-72V168c0-39.8 32.2-72 72-72H288V32c0-17.7 14.3-32 32-32zM208 384c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H208zm96 0c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H304zm96 0c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H400zM264 256a40 40 0 1 0 -80 0 40 40 0 1 0 80 0zm152 40a40 40 0 1 0 0-80 40 40 0 1 0 0 80zM48 224H64V416H48c-26.5 0-48-21.5-48-48V272c0-26.5 21.5-48 48-48zm544 0c26.5 0 48 21.5 48 48v96c0 26.5-21.5 48-48 48H576V224h16z"/>
                                    </svg>
                                </h3>
                                <iframe width="100%" height="400"
                                        src="<?php echo $data["log"] ?>#s1-s1-s1-s1-s1-s1"></iframe>
                                <iframe class="mt-4" width="100%" height="400"
                                        src="<?php echo $data["report"] ?>"></iframe>
                            </div>
                            <?php
                        }
                    }

                    ?>

                </div>
            </div>

            <?php if (count($testCases) > 0) { ?>
                <div class="row">
                    <div class="col-12">
                        <h1 class="text-center text-uppercase pb-4 my-5 position-relative">Testovací
                            případy <?php if ($file != $manager::INDEX) echo "v sadě"; ?></h1>
                    </div>
                    <?php
                    foreach ($testCases as $tc) {
                        ?>
                        <div class="col-12 col-md-6 col-lg-3 card border-0 my-3" href="#">
                            <a class="card-body position-relative text-decoration-none btn btn-outline-secondary p-3 d-flex flex-column justify-content-between"
                               href="index.php?name=<?php echo $tc["path"] ?>">
                                <h6 class="card-title mt-4 text-uppercase"><?php echo $tc["Název"] ?></h6>
                                <?php
                                if ($tc["Automatizované"]) {
                                    ?>
                                    <svg class="position-absolute end-0 top-0 mt-1 me-1" style="width: 30px"
                                         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                        <!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <path d="M320 0c17.7 0 32 14.3 32 32V96H472c39.8 0 72 32.2 72 72V440c0 39.8-32.2 72-72 72H168c-39.8 0-72-32.2-72-72V168c0-39.8 32.2-72 72-72H288V32c0-17.7 14.3-32 32-32zM208 384c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H208zm96 0c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H304zm96 0c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H400zM264 256a40 40 0 1 0 -80 0 40 40 0 1 0 80 0zm152 40a40 40 0 1 0 0-80 40 40 0 1 0 0 80zM48 224H64V416H48c-26.5 0-48-21.5-48-48V272c0-26.5 21.5-48 48-48zm544 0c26.5 0 48 21.5 48 48v96c0 26.5-21.5 48-48 48H576V224h16z"/>
                                    </svg>
                                <?php } ?>
                                <h6 class="card-subtitle my-2 ms-3 position-absolute top-0 start-0"><?php echo $tc["ID"] ?></h6>
                                <p class="card-text"
                                   style="line-height: 1.5em; height: 4.5em; overflow: hidden; text-align: justify">
                                    <?php
                                    echo $tc["smallText"];
                                    ?>
                                </p>
                            </a>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            <?php } ?>

            <?php if (isset($testSets) && count($testSets) > 0 && !isset($_GET["manual"]) && !isset($_GET["automatized"])) { ?>
                <div class="row">
                    <div class="col-12">
                        <h1 class="text-center text-uppercase text-primary pb-4 my-5 position-relative ts-after">
                            Testovací
                            sady <?php if ($file != $manager::INDEX) echo "v sadě" ?></h1>
                    </div>
                    <?php
                    foreach ($testSets as $ts) {
                        ?>
                        <div class="col-12 col-md-6 col-lg-3 card border-0 my-3" href="#">
                            <a class="card-body position-relative text-decoration-none btn btn-outline-primary p-3"
                               href="index.php?name=<?php echo $ts["path"] ?>">
                                <h6 class="card-subtitle my-2 ms-3 position-absolute top-0 start-0"><?php echo $ts["ID"] ?></h6>
                                <h6 class="card-subtitle my-2 me-3 position-absolute top-0 end-0"><?php echo $ts["testCases"] . " TP" ?></h6>
                                <h6 class="card-title mt-4 text-uppercase"><?php echo $ts["Název"] ?></h6>
                                <p class="card-text"
                                   style="line-height: 1.5em; height: 4.5em; overflow: hidden; text-align: justify">
                                    <?php
                                    echo $ts["Popis"];
                                    ?>
                                </p>
                            </a>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            <?php } ?>

        </div>
</section>

</body>
</html>