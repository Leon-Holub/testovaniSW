*** Settings ***
Resource    ../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_013 - Testování tvorby poptávky na vozidlo.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresaTvorbyPoptavky}

TP_026 - Tvorba plně vyplněné poptávky
    Wait And Click    ${selector-button-poptavka}
    Wait Until Element Is Visible    ${selector-modal}
    Check and input text    ${selector-input-name}    ${data-name}
    Check and input text    ${selector-input-surname}    ${data-surname}
    Check and input text    ${selector-input-phone}    ${data-phone}
    Check and input text    ${selector-input-email}    ${data-email}
    Check And Input TextArea    ${selector-input-message}    ${data-message}
    Click Element    ${selector-button-send}
    Wait Until Element Is Visible    ${selector-h1-detailPoptávky}
    Check if text is equal    ${selector-h5-name}  ${data-name}
    Check if text is equal    ${selector-h5-surname}  ${data-surname}
    Log Location
