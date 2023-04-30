*** Settings ***
Resource    ./TS_010 - Testování filtrace vozidel.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresa-vyhledavacVozidel}

TP_013 - Test splněné kombinace filtrů
    Set Value On Custom Select    ${selector-div-customSelect-druhZnacka}  ${selector-div-customSelect-option-znacka-BMW}
    Set Value On Custom Select    ${selector-div-customSelect-model}  ${selector-div-customSelect-option-model-xc90}
    Set Focus And Wait    ${selector-section-foundCars}
    Check Count Of Occurrences    ${selector-div-carCard}  ${count-carNotFound}
    Page Should Contain Element    ${selector-h3-carNotFound}