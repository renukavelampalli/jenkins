*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/LoginKeyword.robot
Library     DataDriver     ../day3/Sample.csv   sheet_name=Sheet1

Test Setup      Open the browser
Test Teardown       Close the browser
Test Template      Login functionality

*** Keywords ***
Login functionality
    [Arguments]     ${username}    ${password}
    Enter username and password    ${username}    ${password}
    Click login button

*** Test Cases ***
Test the login function with csv   ${username}    ${password}