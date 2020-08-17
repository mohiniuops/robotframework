*** Settings ***
Documentation    Suite description
Library  Selenium2Library

*** Variables ***
${LOGIN URL}      https://n.vodafone.ie/en.html#


*** Test Cases ***
Test Open vodafone portal
    Open Browser  ${LOGIN URL}
    Click button    Accept All Cookies
    Sleep    10s
Portal Login
    Click Element  //a[contains(@id,'login_icon_link')]
    Input Text    login__username    ${username}
    Sleep    5s
    Click button    Continue
    Sleep    5s
    Input text    login__password    ${password}
    Sleep   5s
    Click Button    Login
    Sleep    5s

Download Bill
    Wait Until Page Contains Element	id=download-document-button-74481155
    Click Element    //a[contains(@id,'download-document-button-74481155')]

Close Browser
    Close Browser
