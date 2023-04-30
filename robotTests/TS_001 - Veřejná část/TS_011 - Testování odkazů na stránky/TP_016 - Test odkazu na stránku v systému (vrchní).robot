*** Settings ***
Resource    ./TS_011 - Testování odkazů na stránky.robot
*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_016 - Test odkazu na stránku v systému (vrchní)
    Set Focus And Wait    ${selector-a-header-prvniStranka}
    Wait And Click    ${selector-a-header-prvniStranka}
    Wait Until Location Is  ${adresa-prvniStranka}
    Location Should Be    ${adresa-prvniStranka}