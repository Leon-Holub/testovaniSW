*** Settings ***
Resource    ./Variables - TS_014 - Testování nastavení autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-settings}

TP_030 - Přidání textu novinek
    Input TinyMCE Text    ${selector-tinyMCE-settings}  ${data-tinyMCe-Text}
    Wait And Click    ${selector-input-absolute-submit}
    Wait And Click    ${selector-a-homeLink-image}
    Location Should Be    ${homeURL}
    Page Should Contain Element    ${selector-section-homepageNews}
    ${text}=    Set Variable    ${data-tinyMCe-Text}
    ${text}=    Set Variable    ${text.replace('\"', '')}
    Check If Text Is Equal  ${selector-p-homepageNews}  ${text}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window