*** Settings ***
Resource    ./Variables - TS_014 - Testování nastavení autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-texty}

TP_034 - Změnení textu na hlavní stránce
    Wait And Click  ${selector-a-editText}
    Wait Until Element Is Visible  ${selector-input-textArea-editText}
    Element Should Be Visible    ${selector-input-textArea-editText}
    Set Focus And Wait  ${selector-input-textArea-editText}
    Check And Input TextArea    ${selector-input-textArea-editText}  ${data-editText-text}
    Wait And Click    ${selector-input-submit-addText}
    Wait Until Element Is Not Visible    ${selector-input-textArea-editText}
    Wait And Click    ${selector-a-homeLink-image}
    Location Should Be    ${homeURL}
    Set Focus And Wait    ${selector-section-offers}
    Set Focus And Wait    ${selector-h5-offer-addedText}
    Check If Text Is Equal    ${selector-h5-offer-addedText}  ${data-editText-text}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window