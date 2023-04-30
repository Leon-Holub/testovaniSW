*** Settings ***
Resource    ../main-settings-variables-keywords.robot

*** Variables ***
${adresa-signIn}  ${homeURL}admin/sign-in
${adresa-dahsboard}  ${homeURL}Dashboard
${adresa-kontakt}  ${homeURL}kontakt

${selector-input-login-email}  //input[@id='frm-signInForm-email']
${selector-input-login-password}  //input[@id='frm-signInForm-password']
${selector-input-login-submit}  //input[@name='_submit']
${selector-a-homeLink-image}  //img[@src='/autobazarDrabek/dist/images/logo-auto-drabek.png']/parent::a
${selector-a-logoutInDashboard}  //div[@id="main"]//a[@href="/autobazarDrabek/Odhlásit se"]

${data-login-email}  leonhol@seznam.cz
${data-login-password}  1234567890a

*** Keywords ***
Open browser and accept danger In Login
    [Arguments]    ${URL}
    Open Browser  ${URL}  ${google}
    Maximize Browser Window
    Click Element    //*[@id="details-button"]
    Wait Until Element Is Visible    //*[@id="proceed-link"]
    Click Element    //*[@id="proceed-link"]
    Wait Until Element Is Visible    //form[@id='frm-signInForm']
    Location Should Be    ${URL}

Open browser Accept danger And Login
    [Arguments]    ${URL}
    Open browser and accept danger In Login  ${adresa-signIn}
    Login To System
    Go To    ${URL}

Login To System With Data
    [Arguments]    ${email}  ${password}
    Set Focus And Wait    ${selector-input-login-email}
    Check And Input Text    ${selector-input-login-email}  ${email}
    Set Focus And Wait    ${selector-input-login-password}
    Check And Input Text    ${selector-input-login-password}  ${password}
    Wait And Click  ${selector-input-login-submit}

Login To System
    Login To System With Data  ${data-login-email}  ${data-login-password}
    Wait Until Location Is    ${adresa-dahsboard}
    Location Should Be    ${adresa-dahsboard}

Log Out And Close Window
    Go To    ${adresa-dahsboard}
    Wait And Click    ${selector-a-logoutInDashboard}
    Close Window