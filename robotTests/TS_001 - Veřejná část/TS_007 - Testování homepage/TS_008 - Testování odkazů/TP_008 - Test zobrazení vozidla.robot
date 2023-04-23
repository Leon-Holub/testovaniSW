*** Settings ***
Resource    ../../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_008 - Testování odkazů.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_008 - Test zobrazení vozidla
    Set Focus And Wait    ${selector-section-tips}
    Set Focus And Wait    ${selector-a-BMW}
    Wait And Click    ${selector-a-BMW}
    Wait Until Location Is    ${adresa-BMW}
    Location Should Be    ${adresa-BMW}
