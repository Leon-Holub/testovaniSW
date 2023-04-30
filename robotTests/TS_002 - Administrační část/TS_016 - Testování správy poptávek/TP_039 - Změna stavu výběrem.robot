*** Settings ***
Resource    ./Variables - TS_016 - Testování správy poptávek.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-poptavky}

TP_039 - Změna stavu výběrem
    ${count-poptavky}=  Get Text    ${select-span-requestsCount}
    Wait And Click  ${selector-button-showStatesSelect}
    Set Focus And Wait    ${selector-a-select-acceptRequest}
    Wait And Click    ${selector-a-select-acceptRequest}
    Sleep    1s
    ${count-newPoptavky}=  Get Text  ${select-span-requestsCount}
    Should Not Be Equal As Integers    ${count-newPoptavky}  ${count-poptavky}
    Page Should Contain Element    ${selector-button-showStatesSelect-success}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window