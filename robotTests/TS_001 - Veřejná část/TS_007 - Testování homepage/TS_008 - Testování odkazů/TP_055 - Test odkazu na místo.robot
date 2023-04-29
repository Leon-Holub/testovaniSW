*** Settings ***
Resource    ../../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_008 - Testování odkazů.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_055 - Test odkazu na místo
    Set Focus And Wait    ${selector-section-footer}
    Set Focus And Wait    ${selector-a-map}
    Click Element    ${selector-a-map}
    Switch Tabs  1
    Accept Google
    Check Tab URL  ${adresa-mapy}
