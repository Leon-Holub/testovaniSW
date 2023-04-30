*** Settings ***
Resource    ./TS_011 - Testování odkazů na stránky.robot
*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_017 - Test odkazu na stránku mimo systém (spodní)
    Set Focus And Wait    ${selector-div-footer-odkazy}
    Set Focus And Wait    ${selector-a-footer-portu}
    Wait And Click    ${selector-a-footer-portu}
    Check Tab URL    ${adresa-portu}
