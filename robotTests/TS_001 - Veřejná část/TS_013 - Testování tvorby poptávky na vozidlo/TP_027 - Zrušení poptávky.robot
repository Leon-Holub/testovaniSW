*** Settings ***
Resource    ../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_013 - Testování tvorby poptávky na vozidlo.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresa-zruseniPoptávky}

TP_027 - Zrušení poptávky
    Wait Until Element Is Visible    ${selector-h1-detailPoptávky}
    Set Focus And Wait    ${selector-button-zrušitPoptávku}
    Click Link    ${selector-button-zrušitPoptávku}
    Accept Modal Dialog
    Set Focus And Wait    ${selector-alert}
    Check If Text Is Without Non-Breakable Spaces    ${selector-alert}  ${message-request-cancel}