*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary


*** Variables ***
${Baseurl}      https://jsonplaceholder.typicode.com/
${response}
${data}
*** Keywords ***
Get request in API
    Create Session    session1    ${Baseurl}
    ${response}=    Get Request    session1   posts
    Should Be Equal As Numbers    ${response.status_code}    200
    Log     ${response.json()}

Post request in API
    Create Session    session2    ${Baseurl}
    ${data}=     Create Dictionary       userid=222     id=222
    ${response}=    Post Request    session2    posts   json=${data}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log     ${response.json()}

Put request in API
    Create Session    session3    ${Baseurl}
    ${data}=     Create Dictionary       userid=222     id=221
    ${response}=    Put Request    session3    posts/1   json=${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log     ${response.json()}

Deleting the request
    Create Session    session4    ${Baseurl}
    ${response}=    Delete Request    session4    posts/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log     ${response.json()}

*** Test Cases ***
API TESTING
    Get request in API
    Post request in API
    Put request in API
    Deleting the request