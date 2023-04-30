*** Settings ***
Resource    ./Variables - TS_018 - Kontrola generace slugu stránky.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč, přihlaš se a přejdi na stránku
    Open browser accept danger And Login    ${adresa-navigation}

TP_053 - Změna pozice ve spodním menu
    Wait And Click    ${selector-a-dolniMenu}
    Wait Until Location Is  ${adresa-navigation-bottom}
    Location Should Be    ${adresa-navigation-bottom}
    ${FAIPosition}=  Get Text    ${selector-td-position-FAI}
    ${DNPosition}=  Get Text    ${selector-td-position-DlouhýNázev}
    Wait And Click    ${selector-td-position-DlouhýNázev}
    Check And Input Text    ${selector-input-changePosition-DlouhýNázev}  ${FAIPosition}
    Sleep    0.5s
    ${FAIPositionNew}=  Get Text    ${selector-td-position-FAI}
    ${DNPositionNew}=  Get Text    ${selector-td-position-DlouhýNázev}
    Should Be Equal As Integers    ${FAIPositionNew}  ${DNPosition}
    Should Be Equal As Integers    ${FAIPosition}  ${DNPositionNew}

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window