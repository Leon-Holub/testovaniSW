*** Settings ***
Resource    ./Variables - TS_014 - Testování nastavení autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-settings}

TP_029 - Zrušení textu novinek
    Input TinyMCE Text    ${selector-tinyMCE-settings}  ${data-tinyMCe-empty}
    Wait And Click    ${selector-input-absolute-submit}
    Wait And Click    ${selector-a-homeLink-image}
    Location Should Be    ${homeURL}
    Page Should Not Contain Element    ${selector-section-homepageNews}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window