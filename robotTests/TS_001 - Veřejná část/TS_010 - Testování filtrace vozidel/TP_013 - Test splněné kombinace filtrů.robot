*** Settings ***
Resource    ./TS_010 - Testování filtrace vozidel.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresa-vyhledavacVozidel}

TP_013 - Test splněné kombinace filtrů
    Set Value On Custom Select    ${selector-div-customSelect-druhVozidla}  ${selector-div-customSelect-option-osobníVůz}
    Set Value On Custom Select    ${selector-div-customSelect-karoserie}  ${selector-div-customSelect-option-karoserie-combi}
    Set Value On Custom Select    ${selector-div-customSelect-druhZnacka}  ${selector-div-customSelect-option-znacka-Volvo}
    Set Value On Custom Select    ${selector-div-customSelect-model}  ${selector-div-customSelect-option-model-xc90}
    Set Value On Custom Select    ${selector-div-customSelect-typPaliva}  ${selector-div-customSelect-option-palivo-diesel}
    Set Value On Custom Select    ${selector-div-customSelect-typPrevodovky}  ${selector-div-customSelect-option-prevodovka-manual}
    Set Focus And Wait    ${selector-section-foundCars}
    Check Count Of Occurrences    ${selector-div-carCard}  ${count-fullInputs}