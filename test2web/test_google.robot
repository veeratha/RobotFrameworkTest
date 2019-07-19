*** Settings ***
Library   SeleniumLibrary
Test Teardown  Close Browser

*** Variables ***

*** Test Cases ***
Open google
    [Tags]  goo
    เปิดเว็บ

*** Keywords ***
เปิดเว็บ
    Open Browser  http://www.google.com  gc
