*** Settings ***
Resource    ./Variables - TS_018 - Kontrola generace slugu stránky.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-navigation}

TP_051 - Vytvoření stránky
    Wait And Click    ${selector-a-addPage}
    Wait Until Location Is    ${adresa-navigation-pageAdd}
    Location Should Be    ${adresa-navigation-pageAdd}
    Set Focus And Wait    ${selector-input-name}
    Check And Input Text    ${selector-input-name}  ${data-name}
    Textfield Should Contain    ${selector-input-slug}  ${data-check-nameToSlug}
    Input TinyMCE Text    ${selector-input-tinyMCE}  ${data-pageContent}
    Select From List By Label    ${selector-input-select-position}  ${data-positionBottom}
    List Selection Should Be    ${selector-input-select-position}  ${data-positionBottom}
    Select From List By Label    ${selector-input-select-state}   ${data-statePublic}
    List Selection Should Be    ${selector-input-select-state}   ${data-statePublic}
    Wait And Click    ${selector-input-submit}
    Wait Until Location Is    ${adresa-navigation}
    Location Should Be    ${adresa-navigation}
    Wait And Click    ${selector-a-showPage}
    Wait Until Location Is    ${adresa-navigation-page-dlouhyNazev}
    Location Should Be    ${adresa-navigation-page-dlouhyNazev}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window