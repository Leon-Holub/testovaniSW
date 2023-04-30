*** Settings ***
Resource    ./Variables - TS_012 - Testování přihlášení do systému.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku loginu
    Open browser and accept danger In Login    ${adresa-signIn}

TP_024 - Neúspěšné přihlášení do systému kvůli emailu
    Login To System With Data  ${data-bad-email}  ${data-login-password}
    Location Should Contain    ${adresa-signIn}
    Check Alert State  ${alert-state-danger}  ${alert-login-fail-text}