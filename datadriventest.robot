*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.facebook.com/
${Browser}  headlesschrome
${username}     user2
${password}     pwd2
*** Keywords ***
Open the Browser
    Open Browser    ${url}  ${Browser}

Close the Browser
    Close All Browsers

Input the Username
    Input Text    id=email    ${username}
    
Input the password
    Input Password    id=pass    ${password}

Click login Button
    Click Button    xpath=//button[@name='login']

*** Test Cases ***
Validate the login functionality
    Open the Browser
    Input the Username
    Input the password
    Sleep    2s
    Click login Button
    Close the Browser
