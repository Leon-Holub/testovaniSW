*** Settings ***
Resource    ./Variables - TS_016 - Testování správy poptávek.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-poptavky}

TP_057 - Kontrola počtu nevyyřízených poptávek
    ${requestCountInMenu}=  Get Text    ${select-span-requestsCount}
    Wait And Click    ${selector-a-nastenka}
    Wait Until Location Is  ${adresa-dahsboard}
    Location Should Be    ${adresa-dahsboard}
    Check If Text Is Equal    ${selector-th-RequestCount}  ${requestCountInMenu}



Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window