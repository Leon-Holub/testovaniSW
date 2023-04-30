*** Settings ***
Resource    ./Variables - TS_014 - Testování nastavení autobazaru.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-texty}

TP_035 - Smazání textu na hlavní stránce
    Wait And Click    ${selector-a-deleteText}
    Accept Modal Dialog
    Wait Until Element Is Not Visible    ${selector-tr-textRow}
    Page Should Not Contain Element    ${selector-tr-textRow}
    Wait And Click    ${selector-a-homeLink-image}
    Location Should Be    ${homeURL}
    Set Focus And Wait    ${selector-section-offers}
    ${lastText}=  Get Text    ${selector-h5-offer-addedText}
    Should Not Be Equal As Strings    ${data-editText-text}  ${lastText}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window