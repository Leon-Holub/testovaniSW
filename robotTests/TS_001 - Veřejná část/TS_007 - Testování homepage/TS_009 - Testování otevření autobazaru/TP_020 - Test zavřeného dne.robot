*** Settings ***
Resource    ../../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_009 - Testování otevření autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_020 - Test zavřeného dne
    Element Should Be Visible And Contain  ${selector-a-openState}  ${text-a-closedState}