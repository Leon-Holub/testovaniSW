*** Settings ***
Resource    ./Variables - TS_012 - Testování přihlášení do systému.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku loginu
    Open browser and accept danger In Login    ${adresa-signIn}

TP_023 - Neúspěšné přihlášení do systému kvůli heslu
    Login To System With Data  ${data-login-email}  ${data-bad-password}
    Location Should Contain    ${adresa-signIn}
    Check Alert State  ${alert-state-danger}  ${alert-login-fail-text}