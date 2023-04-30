*** Settings ***
Resource    ./TS_011 - Testování odkazů na stránky.robot
*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_015 - Test odkazu na stránku v systému (spodní)
    Set Focus And Wait    ${selector-div-footer-odkazy}
    Set Focus And Wait    ${selector-a-footer-nazev}
    Click Element    ${selector-a-footer-nazev}
    Wait Until Location Is  ${adresa-nazev}
    Location Should Be    ${adresa-nazev}