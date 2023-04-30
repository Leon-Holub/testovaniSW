*** Settings ***
Resource    ./Variables - TS_018 - Kontrola generace slugu stránky.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-navigation}

TP_052 - Vytvoření odkazu
    Wait And Click    ${selector-a-addPage}
    Wait Until Location Is    ${adresa-navigation-pageAdd}
    Location Should Be    ${adresa-navigation-pageAdd}
    Set Focus And Wait    ${selector-input-name}
    Check And Input Text    ${selector-input-name}  ${data-name-TP_051}
    Textfield Should Contain    ${selector-input-slug}  ${data-name-TP_051}
    Wait And Click    ${selector-label-typeOdkaz}
    Check And Input Text    ${selector-input-link}  ${data-pageLink}
    Select From List By Label    ${selector-input-select-position}  ${data-positionBottom}
    List Selection Should Be    ${selector-input-select-position}  ${data-positionBottom}
    Select From List By Label    ${selector-input-select-state}   ${data-statePublic}
    List Selection Should Be    ${selector-input-select-state}   ${data-statePublic}
    Wait And Click    ${selector-input-submit}
    Wait Until Location Is    ${adresa-navigation}
    Location Should Be    ${adresa-navigation}
    Wait And Click    ${selector-a-showPage-outside}
    Sleep    1s
    Check Tab URL    ${data-pageLink}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window