*** Settings ***
Library     SeleniumLibrary

Test Setup      Open the browser
Test Teardown       Close the browser

*** Variables ***
${url}      https://www.google.com/
${browser}      chrome

*** Keywords ***
Open the browser
    Open Browser    ${url}      ${browser}
    Maximize Browser Window

Close the Browser
    Close Browser
    
Searching various inputs
    [Arguments]     ${search}
    Input Text    xpath=//div/textarea[@aria-label="Search"]    ${search}
    Press Keys      xpath=//div/textarea[@aria-label="Search"]  \\13
    #\\13 is used to click enter
    Wait Until Page Contains Element    xpath=//div/textarea[@aria-label="Search"]  ${search}
    Sleep    2s
    Go To    ${url}

*** Test Cases ***
Data Driven Test
    Searching various inputs    apple
    Searching various inputs    robo framework
    Searching various inputs    India


    