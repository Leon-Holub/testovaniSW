*** Settings ***
Resource    ./Variables - TS_014 - Testování nastavení autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-settings}

TP_032 - Nastavení dovolené
    Input Text    ${selector-input-holiday}  ${data-settings-holiday}
    Wait And Click    ${selector-input-absolute-submit}
    Wait And Click    ${selector-a-homeLink-image}
    Location Should Be    ${homeURL}
    Check If Text Is Equal    ${selector-a-openState}  ${check-text-closed}
    Wait And Click    ${selector-a-openState}
    Wait Until Location Is  ${adresa-kontakt}
    Check If Text Is Equal Without Non-Breakable Spaces    ${selector-div-contact-alert}  ${check-text-holiday}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window