*** Settings ***
Resource    ./TS_010 - Testování filtrace vozidel.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresa-vyhledavacVozidel}

TP_012 - Test check boxů
    Wait And Click    ${selector-checkbox-4x4}
    Set Focus And Wait    ${selector-section-foundCars}
    Check Count Of Occurrences    ${selector-div-carCard}  ${count-4x4}
