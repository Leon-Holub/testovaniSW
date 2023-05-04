<?php

class testManager
{
    const INDEX = "./tests/";

    public $knownKeys = ["Pre-conditions", "Testovací kroky", "Post-conditions", "Očekávaný výsledek", "Vstupní data", "smallText", "path", "log", "robot", "report"];
    private $keyInherits = ["Pre-conditions", "Post-conditions", "Očekávaný výsledek"];
    private $file = "";
    private bool $automatized = false;
    private bool $manual = false;
    public array $data = [];
    public array $parents;
    public array $testCases;


    public function __construct($file, $automatized, $manual)
    {
        $this->file = $file;
        $this->automatized = $automatized;
        $this->manual = $manual;
        if ($file != self::INDEX)
            $this->data = $this->getContent();
    }

    private function getDir($file)
    {
        if ($file == self::INDEX) {
            $pos = strripos(self::INDEX, "/");
            $dirname = substr(self::INDEX, 0, $pos);
            return $dirname;
        }

        return dirname($file);
    }

    private static function returnFileContent($fileString)
    {
        $file = fopen($fileString, "r");
        $fileContent = fread($file, filesize($fileString));
        return $fileContent;
    }

    public static function printFile($fileString)
    {

        //$file = fopen($fileString, "r");
        $fileContent = self::returnFileContent($fileString);
        $lines = explode("\n", $fileContent);

        foreach ($lines as $line) {
            if ($line[0] == " ") {
                echo "<p class='ms-3 mb-1'>$line</p>";
            } else if ($line[0] == "*") {
                echo "<p class='my-2'>$line</p>";
            } else {
                echo "<p class='mb-1'>$line</p>";
            }
        }
        //$fileContent = str_replace(["\n", "\t"], ["<br>", "- "], $fileContent);
        //echo $fileContent;
    }

    function getContent($fileString = "")
    {
        if ($fileString == "")
            $fileString = $this->file;

        $data = array();
        $file = fopen($fileString, "r");
        $fileContent = fread($file, filesize($fileString));

        $lines = explode("\n", $fileContent);
        $lastKey = "";
        $i = 0;
        foreach ($lines as $line) {
            $parts = explode("=>", $line);
            $key = trim($parts[0]);
            $value = trim($parts[1]);

            if ($value == "" && !in_array($key, $this->knownKeys)) {
                if (is_string($data[$lastKey])) {
                    $data[$lastKey] = array();
                }
                if ($lastKey == $this->knownKeys[1] && strpos($key, "->") !== false) {
                    $key = str_replace("->", "<ul><li>", $key);
                    $key .= "</li></ul>";
                }
                array_push($data[$lastKey], $key);
                $i++;
                continue;
            }
            $i = 0;
            $lastKey = $key;
            $data[$key] = $value;
        }

        if (!isset($data["Vstupní data"])) {
            $data["Vstupní data"] = ["Žádná"];
        }

        if ($data["Typ"] == "TP" && (!isset($this->keyInherits[0]) || !isset($this->keyInherits[1]) || !isset($this->keyInherits[3]))) {
            $testSet = $this->getDir($fileString) . ".txt";
            $tesSetContent = $this->getContent($testSet);
            foreach ($this->keyInherits as $key) {
                if (!isset($data[$key])) {
                    $data[$key] = $tesSetContent[$key];
                }
            }
        }

        if (strlen($data["Popis"]) > 100) {
            $data["smallText"] = substr($data["Popis"], 0, 100 + (strpos($data["Popis"], " ", 100) + 1)) . "...";
        } else
            $data["smallText"] = $data["Popis"];

        $data["path"] = $fileString;

        if (isset($data["Automatizované"])) {
            $pos = strripos($fileString, ".");
            $dir = substr($fileString, 0, $pos);
            $data["log"] = str_replace("./tests/", "./robotTests/", $dir) . "/log.html";
            $data["report"] = str_replace("./tests/", "./robotTests/", $dir) . "/report.html";
            $data["robot"] = str_replace("./tests/", "./robotTests/", $dir) . ".robot";

            $pos = strripos($dir, "/");
            $dir = substr($dir, 0, $pos);

            $dir = str_replace("./tests/", "./robotTests/", $dir);

            $files = scandir($dir, SCANDIR_SORT_DESCENDING);
            foreach ($files as $file) {
                if (strpos($file, "TS_") !== false && strpos($file, ".robot")) {
                    $topVariables = $dir . "/" . $file;
                }
            }

            $data["robotTS"] = $topVariables;// . ".robot";//str_replace("./tests/", "./robotTests/", $dir) . ".robot";

        }

        return $data;
    }

    function getParentsTS($fileName, $robotFile)
    {
        if ($fileName == self::INDEX)
            return [];

        $parentsTS = array();
        array_push($parentsTS, "./robotTests/main-settings-variables-keywords.robot");
        array_push($parentsTS, $fileName);

        $dirname = $this->getDir($fileName);


        $pos = strripos($dirname, "/");
        $dirname = substr($dirname, 0, $pos);


        while (true) {

            if ($dirname == "./robotTests")
                break;

            $files = scandir($dirname, SCANDIR_SORT_DESCENDING);

            foreach ($files as $file) {
                if (strpos($file, "TS_") !== false && strpos($file, ".robot")) {
                    array_push($parentsTS, $dirname . "/" . $file);
                }
            }

            $dirname = substr($dirname, 0, strripos($dirname, "/"));
        }

        $mainFileContent = self::returnFileContent($robotFile);
        preg_match_all('/\${(.*?)}/', $mainFileContent, $variablesFromMain);
        $variablesFromMain = $variablesFromMain[0];
        $variablesFromMain = array_unique($variablesFromMain);

        echo '<div style="height: 400px; font-size: 12px; line-height: 1rem" class="bg-black text-white overflow-scroll ">';
        echo "<p class='my-2'>*** Variables ***</p>";
        foreach ($parentsTS as $parentTS) {
            $tsContent = self::returnFileContent($parentTS);
            $tsRows = explode("\n", $tsContent);
            foreach ($tsRows as $row) {
                if ($row[0] == "$") {
                    foreach ($variablesFromMain as $var) {
                        if (strpos($row, $var) !== false) {
                            echo "<p class='my-2'>$row</p>";
                        }
                    }
                }
            }
        }
        echo '</div>';

        $mainFileWithoutVars = str_replace($variablesFromMain, "", $mainFileContent);
        $Keywords = explode("\n", $mainFileWithoutVars);
        $Keywords = array_unique($Keywords);

        echo '<h4 class="mt-3 mb-0 text-center">Keywords použité v TP</h4>
              <p class="mt-0 text-center">(Vybané ze všech rodičovských TS)</p>';

        echo '<div style="height: 400px; font-size: 12px; line-height: 1rem" class="bg-black text-white overflow-scroll ">';
        echo "<p class='my-2'>*** Keywords ***</p>";
        unset($Keywords[array_search("\n", $Keywords)]);
        foreach ($Keywords as $key => $keyword) {
            if (strlen($keyword) == 1) {
                unset($Keywords[$key]);
            }
        }

        foreach ($parentsTS as $parentTS) {
            $tsContent = self::returnFileContent($parentTS);
            $keywordsPart = false;

            $stateKeyword = false;
            $tsRows = explode("\n", $tsContent);
            foreach ($tsRows as $row) {

                if ($keywordsPart && !$stateKeyword && $row[0] != "$" && $row[0] != " ") {
                    foreach ($Keywords as $kw) {
                        $lowerRow = str_replace(" ", "", strtolower($row));
                        $lowerKw = str_replace(" ", "", strtolower($kw));
                        if (strpos($lowerRow, $lowerKw) !== false) {
                            $stateKeyword = true;
                            break;
                        }
                    }
                }

                if ($row[0] == "$")
                    continue;
                elseif ($row[0] == " " && $keywordsPart && $stateKeyword) {
                    echo "<p class='ms-3 mb-1'>$row</p>";
                } else if ($keywordsPart && $stateKeyword && strlen($row) == 1) {
                    echo "<br>";
                    $stateKeyword = false;
                } else if ($keywordsPart && $stateKeyword) {
                    echo "<p class='mb-1'>$row</p>";
                }

                if (!$keywordsPart && strpos($row, "Keywords") !== false) {
                    $keywordsPart = true;
                }
            }
            /*
            foreach ($tsRows as $row) {
                foreach ($Keywords as $keyword) {
                    if (strpos($row, $keyword) !== false) {
                        //echo "<p class='my-2'>$row</p>";
                    }
                }
            }*/
        }

        echo '</div>';
        return $variablesFromMain;
    }


    function getParents($fileName)
    {
        if ($fileName == self::INDEX)
            return [];

        $dirname = $this->getDir($fileName);

        //$pos = strripos($dirname, "/");
        //$dirname = substr($dirname, 0, $pos);
        $parents = array();
        while (true) {
            if ($dirname == "./tests")
                break;

            $content = $this->getContent($dirname . ".txt");
            array_push($parents, $content);

            $dirname = substr($dirname, 0, strripos($dirname, "/"));
        }
        return $parents;
    }

    function getTestCases($fileName)
    {
        $dirname = $this->getDir($fileName);
        if ($fileName == self::INDEX)
            return $this->findAllTestCases();

        if ($this->data["Typ"] == "TS") {
            $dirname = str_replace(".txt", "/", $fileName);
        } else {
            $dirname .= "/";
        }

        //$dirname = str_replace(".txt", "/", $fileName);
        $files = scandir($dirname, SCANDIR_SORT_DESCENDING);
        $testCases = array();
        foreach ($files as $file) {
            if ($file == "." || $file == "..")
                continue;
            if (strpos($file, ".txt") > 0) {
                $content = $this->getContent($dirname . $file);
                if ($content["Typ"] == "TP") {
                    $testCases[$content["ID"]] = $content;
                }
            }
        }

        ksort($testCases);
        return $testCases;
    }

    function getTestSets($fileName)
    {
        $dirname = $this->getDir($fileName);
        if ($fileName == self::INDEX)
            return $this->findAllTestSets();

        if ($this->data["Typ"] == "TS") {
            $dirname = str_replace(".txt", "/", $fileName);
        } else {
            $dirname .= "/";
        }
        $files = scandir($dirname, SCANDIR_SORT_DESCENDING);
        $testSets = array();
        foreach ($files as $file) {
            if ($file == "." || $file == "..")
                continue;
            if (strpos($file, ".txt") > 0) {
                $content = $this->getContent($dirname . $file);
                if ($content["Typ"] == "TS") {
                    $tpFiles = scandir(str_replace(".txt", "/", $content["path"]));
                    $testCasesCount = 0;
                    foreach ($tpFiles as $f) {
                        if (strpos($f, "TP") !== false)
                            $testCasesCount++;
                    }
                    $content["testCases"] = $testCasesCount;
                    $testSets[$content["ID"]] = $content;
                }
            }
        }
        ksort($testSets);
        return $testSets;
    }

    private function findTextFiles($dir, &$result)
    {
        $files = scandir($dir);
        foreach ($files as $file) {
            if ($file != '.' && $file != '..') {
                $path = $dir . DIRECTORY_SEPARATOR . $file;
                if (is_dir($path)) {
                    $this->findTextFiles($path, $result); // rekurzivní volání pro složku
                } else if (pathinfo($path, PATHINFO_EXTENSION) === 'txt') {
                    $result[] = $path; // přidání textového souboru do výstupního pole
                }
            }
        }
    }

    public function findAllTestCases()
    {
        $dir = $this->getDir(self::INDEX);
        $textFiles = array();
        $this->findTextFiles($dir, $textFiles);
        $testCases = array();
        foreach ($textFiles as $file) {
            $content = $this->getContent(str_replace("\\", "/", $file));
            if ($content["Typ"] == "TP") {
                if ($this->automatized) {
                    if (isset($content["Automatizované"]))
                        $testCases[$content["ID"]] = $content;
                } else {
                    $testCases[$content["ID"]] = $content;
                }
            }
        }
        ksort($testCases);
        return $testCases;
    }

    public function findAllTestSets()
    {
        $dir = $this->getDir(self::INDEX);
        $textFiles = array();
        $this->findTextFiles($dir, $textFiles);
        $testSets = array();
        foreach ($textFiles as $file) {
            $content = $this->getContent(str_replace("\\", "/", $file));
            if ($content["Typ"] == "TS") {
                $files = scandir(str_replace(".txt", "/", $content["path"]));
                $testCasesCount = 0;
                foreach ($files as $f) {
                    if (strpos($f, "TP") !== false)
                        $testCasesCount++;
                }
                $content["testCases"] = $testCasesCount;
                $testSets[$content["ID"]] = $content;
            }
        }
        ksort($testSets);
        return $testSets;
    }

}



