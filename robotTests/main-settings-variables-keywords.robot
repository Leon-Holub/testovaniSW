*** Settings ***
Library  SeleniumLibrary  run_on_failure=Nothing

*** Variables ***
${google}  Chrome
${homeURL}  https://localhost/autobazarDrabek/

${selector-modal}  //div[@class="modal fade modal-xl show"]
${selector-modal-acceptance}  //div[@id="modal-accept"]
${selector-modal-acceptance-accept}  //a[contains(text(),"Ano")]

${selector-alert}  //div[@role="alert"]

${selector-content}  //section[@class="content"]
${selector-logo}  //img[@alt='logo autobazaru']


*** Keywords ***
Open browser and accept danger
    [Arguments]    ${URL}
    Open Browser  ${URL}  ${google}
    Maximize Browser Window
    Click Element    //*[@id="details-button"]
    Wait Until Element Is Visible    //*[@id="proceed-link"]
    Click Element    //*[@id="proceed-link"]
    Wait Until Element Is Visible    //div[@id="main"]
    Location Should Be    ${URL}
    #Slowdown Selenium Robot

Slowdown selenium robot
    Set Selenium Speed    1

Check and input text
    [Arguments]    ${selector}  ${text}
    Wait Until Element Is Visible    ${selector}
    Input Text    ${selector}    ${text}
    Textfield Should Contain    ${selector}  ${text}

Check and input textArea
    [Arguments]    ${selector}  ${text}
    Wait Until Element Is Visible    ${selector}
    Input Text    ${selector}    ${text}
    Textarea Should Contain    ${selector}  ${text}

Check if text is equal
    [Arguments]    ${selector}  ${text}
    ${selectedText}=  Get Text    ${selector}
    Should Be Equal    ${selectedText}  ${text}

Check If Text Is Equal Without Non-Breakable Spaces
    [Arguments]    ${selector}  ${text}
    ${element_text}=    Get Text    ${selector}
    ${element_text}=    Set Variable    ${element_text.replace(' ', '')}
    Should Be Equal    ${element_text}  ${text.replace(' ', '')}

Check Count Of Occurrences
    [Arguments]    ${selector}  ${count}
    ${elementCount}=  Get Element Count    ${selector}
    Should Be Equal As Integers    ${elementCount}  ${count}

Element should be visible and contain
    [Arguments]    ${selector}  ${text}
    Element Should Be Visible    ${selector}
    Check If Text Is Equal Without Non-Breakable Spaces    ${selector}  ${text}

Wait and click
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}
    Click Element    ${selector}

Set Focus and Wait
    [Arguments]    ${selector}
    Set Focus To Element    ${selector}
    Wait Until Element Is Visible    ${selector}
    Sleep    0.5s

Accept Modal Dialog
    Wait Until Element Is Visible    ${selector-modal-acceptance}
    Sleep    0.2s
    Wait And Click    ${selector-modal-acceptance-accept}
    Wait Until Element Is Not Visible    ${selector-modal-acceptance}

Check Tab URL
    [Arguments]    ${location}
    ${handles} =    Get Window Handles
    Switch Window    ${handles[1]}
    Location Should Be    ${location}
    Switch Window    ${handles[0]}