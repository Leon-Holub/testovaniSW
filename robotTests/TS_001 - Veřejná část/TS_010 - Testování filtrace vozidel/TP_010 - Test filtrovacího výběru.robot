*** Settings ***
Resource    ./TS_010 - Testování filtrace vozidel.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresa-vyhledavacVozidel}

TP_010 - Test filtrovacího výběru
    Set Value On Custom Select    ${selector-div-customSelect-druhVozidla}  ${selector-div-customSelect-option-osobníVůz}
    Set Focus And Wait    ${selector-section-foundCars}
    Check Count Of Occurrences    ${selector-div-carCard}  ${count-osobníVůz}