*** Settings ***
Resource    ./TS_011 - Testování odkazů na stránky.robot
*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}

TP_018 - Test odkazu na stránku mimo systém (vrchní)
    Set Focus And Wait    ${selector-a-header-seznam}
    Wait And Click    ${selector-a-header-seznam}
    Check Tab URL    ${adresa-seznam}
