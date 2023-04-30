*** Settings ***
Resource    ./Variables - TS_016 - Testování správy poptávek.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-poptavky}

TP_038 - Zobrazení obsahu poptávky
    Wait And Click    ${selector-a-showRequest}
    Wait Until Element Is Visible    ${selector-div-modal-request}
    Element Should Be Visible    ${selector-div-modal-request}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window