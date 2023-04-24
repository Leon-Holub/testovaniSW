*** Settings ***
Resource    ../../main-settings-variables-keywords.robot
Resource    ./Variables - TS_013 - Testování tvorby poptávky na vozidlo.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku
    Open Browser And Accept Danger    ${homeURL}${adresaTvorbyPoptavky}

TP_028 - Tvorba nevyplněné poptávky
    Wait And Click    ${selector-button-poptavka}
    Wait Until Element Is Visible    ${selector-modal}
    Wait And Click    ${selector-button-send}
    Element Should Be Visible And Contain    ${selector-error-name}  ${message-error}
    Element Should Be Visible And Contain    ${selector-error-surname}  ${message-error}
    Element Should Be Visible And Contain    ${selector-error-email}  ${message-error}
    Check Count Of Occurrences  ${selector-all-errors}  3