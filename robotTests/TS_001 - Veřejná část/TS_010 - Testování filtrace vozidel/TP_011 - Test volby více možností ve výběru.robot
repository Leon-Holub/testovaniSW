*** Settings ***
Resource    ./TS_010 - Testování filtrace vozidel.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresa-vyhledavacVozidel}

TP_011 - Test volby více možností ve výběru
        Set Value On Custom Select    ${selector-div-customSelect-druhZnacka}  ${selector-div-customSelect-option-znacka-BMW}
        Set Value On Custom Select    ${selector-div-customSelect-druhZnacka}  ${selector-div-customSelect-option-znacka-Opel}
        Set Focus And Wait    ${selector-section-foundCars}
        Check Count Of Occurrences    ${selector-div-carCard}  ${count-brand-opel}