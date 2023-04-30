*** Settings ***
Resource    ./Variables - TS_014 - Testování nastavení autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-settings}

TP_031 - Změna otvírací doby
    FOR   ${i}  IN RANGE  1  8
        Check And Input Text    //input[@id="frm-settingsForm-day${i}"]  ${data-settings-openHours}
        END
    Wait And Click    ${selector-input-absolute-submit}
    Wait And Click    ${selector-a-homeLink-image}
    Location Should Be    ${homeURL}
    Check If Text Is Equal    ${selector-a-openState}  ${check-text-opened}
    Wait And Click    ${selector-a-openState}
    Wait Until Location Is  ${adresa-kontakt}
    Check Count Of Occurrences    ${selector-contact-time-9-17}  ${check-data-contact-ocurrences}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window