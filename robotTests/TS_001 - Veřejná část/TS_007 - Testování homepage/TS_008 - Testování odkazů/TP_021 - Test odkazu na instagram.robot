*** Settings ***
Resource    ../../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_008 - Testování odkazů.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_021 - Test odkazu na instagram
    Wait And Click    ${selector-a-instagram}
    Check Tab URL  ${adresa-ig}