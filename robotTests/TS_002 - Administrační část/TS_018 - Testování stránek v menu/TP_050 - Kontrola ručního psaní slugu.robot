*** Settings ***
Resource    ./Variables - TS_018 - Kontrola generace slugu stránky.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-navigation}

TP_050 - Kontrola ručního psaní slugu
    Wait And Click    ${selector-a-addPage}
    Wait Until Location Is    ${adresa-navigation-pageAdd}
    Location Should Be    ${adresa-navigation-pageAdd}
    Set Focus And Wait    ${selector-input-name}
    Check And Input Text    ${selector-input-name}  ${data-name}
    Textfield Should Contain    ${selector-input-slug}  ${data-check-nameToSlug}
    Check And Input Text    ${selector-input-slug}  ${data-name}
    Set Focus To Element    ${selector-input-name}
    Check If Text Is Equal Without Non-Breakable Spaces    ${selector-span-error-slug}  ${data-check-error-slug}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window