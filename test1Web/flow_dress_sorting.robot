*** Settings ***
Library   SeleniumLibrary
Resource  ../pages/welcome.robot  # ใช้ Include File ที่แยก
Suite Setup  เข้าหน้าเว็บ
Suite Teardown  Close Browser
Test Teardown  กลับหน้าแรก
#Test Teardown  Close Browser   #สำหรับจบ Test Case
*** Variables ***
${URL}   http://automationpractice.com
${BROWSER}    gc

*** Test Cases ***
1.Sorting by price
#Tag สำหรับ แยกรัน Process
    [Tags]  done sprint1 
    #เข้าหน้าเว็บ  #ย้ายไปเปิดที่ Suite Setup ด้านบน 
    เลือก Dress -> Summer Dress
    เลือก Sort by Name A-Z
    ผลต้องแสดงชื่อจาก A-Z ถูกต้อง


2.Sorting by name
    [Tags]  progress
    #เข้าหน้าเว็บ  #ย้ายไปเปิดที่ Suite Setup ด้านบน 
    เลือก Dress -> Summer Dress
    เลือก Sort by Name A-Z
    ผลต้องแสดงชื่อจาก A-Z ถูกต้อง


*** Keywords ***
เข้าหน้าเว็บ
    welcome.Open

เลือก Dress -> Summer Dress
    welcome.Choose Dress Menu
    Click Element       xpath://*[@id="categories_block_left"]/div/ul/li[3]/a

เลือก Sort by Name A-Z
    #Click Element      
    Select From List By Value  id:selectProductSort  name:asc
    
ผลต้องแสดงชื่อจาก A-Z ถูกต้อง
    Wait Until Element Contains   xpath://*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a   Printed Summer Dress
    Wait Until Element Contains   xpath://*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a   Printed Summer Dress

กลับหน้าแรก
    welcome.Home