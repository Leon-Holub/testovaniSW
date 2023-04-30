*** Settings ***
Resource    ./Variables - TS_016 - Testování správy poptávek.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-poptavky}

TP_041 - Změna stavu více poptávek
    ${count-poptavky}=  Get Text    ${select-span-requestsCount}
    Set Focus And Wait    ${selector-input-checkbox-114}
    Wait And Click    ${selector-input-checkbox-114}
    Set Focus And Wait    ${selector-input-checkbox-101}
    Wait And Click    ${selector-input-checkbox-101}
    Set Focus And Wait    ${selector-input-checkbox-102}
    Wait And Click    ${selector-input-checkbox-102}
    Select From List By Label    ${selector-select-actions}  ${data-action}
    List Selection Should Be    ${selector-select-actions}  ${data-action}
    ${count-poptavky}=   Convert To Integer    ${count-poptavky}
    ${count-poptavky}=    Evaluate    ${count-poptavky} - 3
    Wait And Click    ${selector-submit-action}
    Sleep    1s
    ${count-newPoptavky}=  Get Text  ${select-span-requestsCount}
    Should Be Equal As Integers    ${count-newPoptavky}  ${count-poptavky}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window