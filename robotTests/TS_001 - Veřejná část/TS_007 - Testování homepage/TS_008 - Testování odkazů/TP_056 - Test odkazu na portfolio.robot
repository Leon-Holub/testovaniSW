*** Settings ***
Resource    ../../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_008 - Testování odkazů.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_056 - Test odkazu na portfolio
    Set Focus And Wait  ${selector-section-footerInfo}
    Set Focus And Wait    ${selector-a-portofilo}
    Wait And Click    ${selector-a-portofilo}
    Check Tab URL  ${adresa-portfolio}