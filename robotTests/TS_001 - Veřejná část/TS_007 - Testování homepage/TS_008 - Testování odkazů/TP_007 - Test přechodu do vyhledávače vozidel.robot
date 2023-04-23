*** Settings ***
Resource    ../../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_008 - Testování odkazů.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_007 - Test přechodu do vyhledávače vozidel
    Wait And Click    ${selector-a-nabídkaNašichVozů}
    Wait Until Location Is    ${adresa-vyhledavace}
    Location Should Be    ${adresa-vyhledavace}
    Wait And Click    ${selector-logo}
    Wait Until Location Is    ${homeURL}
    Location Should Be    ${homeURL}
    Wait And Click    ${selector-a-nabídka}
    Wait Until Location Is    ${adresa-vyhledavace}
    Location Should Be    ${adresa-vyhledavace}