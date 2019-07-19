*** Settings ***
Library  RequestsLibrary

*** Variables ***

*** Test Cases ***
Call top 10 user
    Create Session  api  https://jsonplaceholder.typicode.com
    ${res}=  Get Request  api  /users
    # Check ตัวเลข
    Should be equal  ${200}  ${res.status_code}
    # Check แบบตัวหนังสือ
    Should be equal as strings  200  ${res.status_code}
    ${len}=  Get Length  ${res.json()}
    Should be equal  ${110}  ${len}
    Should be equal  Bret  ${res.json()[0]["username"]}

    

*** Keywords ***