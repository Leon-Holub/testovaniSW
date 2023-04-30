*** Settings ***
Resource    ./Variables - TS_012 - Testování přihlášení do systému.robot

*** Test Cases ***
Pre-conditions - Otevři prohlížeč a jdi na stránku loginu
    Open browser and accept danger In Login    ${adresa-signIn}

TP_022 - Úspěšné přihlášení do systému
    Login To System

Post-conditions - Odhlaš uživatele a zavři prohlížeč
    Log Out And Close Window