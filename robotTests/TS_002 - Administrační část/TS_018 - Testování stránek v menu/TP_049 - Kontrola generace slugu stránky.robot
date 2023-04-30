*** Settings ***
Resource    ./Variables - TS_018 - Kontrola generace slugu stránky.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-navigation}

TP_049 - Kontrola generace slugu stránky
    Wait And Click    ${selector-a-addPage}
    Wait Until Location Is    ${adresa-navigation-pageAdd}
    Location Should Be    ${adresa-navigation-pageAdd}
    Set Focus And Wait    ${selector-input-name}
    Check And Input Text    ${selector-input-name}  ${data-name}
    Textfield Should Contain    ${selector-input-slug}  ${data-check-nameToSlug}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window