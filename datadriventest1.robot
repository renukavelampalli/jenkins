*** Settings ***
Library     SeleniumLibrary

Test Setup      Open the browser
Test Teardown       Close the browser

*** Variables ***
${url}      https://www.facebook.com/
${browser}      chrome
${username}
${password}
*** Keywords ***
Open the browser
    Open Browser    ${url}      ${browser}
    Maximize Browser Window

Close the browser
    Close All Browsers

Validate the login functionality
    [Arguments]     ${username}     ${password}
    Input Text    id=email    ${username}
    Input Text    id=pass    ${password}
    Click Button    xpath=//button[@name='login']
    Sleep    2s
    Go To    ${url}
*** Test Cases ***
Testing the login function
    Validate the login functionality    user1    pass1
    Validate the login functionality    user2    pass2
    Validate the login functionality    user3    pass3