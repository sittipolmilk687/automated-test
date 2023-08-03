*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/register/
${browser}    chrome
${locator_firstname}    id=firstname
${locator_lastname}    id=lastname
${locator_gender}    validation-basic-radio
${locator_checkbox_sql}    name=courses.SQL
${locator_check_manual}    name=courses.Test Manual
${locator_check_auto}    name=courses.Automate Test
${locator_check_auto_2}    name=courses.Automate Test2
${locator_role}    id=select-role
${locator_select_role}    xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_reset}    id=reset
${locator_email}    id=email
${locator_password}    id=password
${locator_phone_number}    id=mobile-phone
${locator_nationality}    id=nationality
${locator_select_nation}    xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_role}    id=select-role
${locator_select_role}   xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_plan}    id=select-plan
${locator_select_plan}   xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_btn_signup}    id=btn-sign-up
${locator_btn_ok}    id=btn-ok
${locator_btn_reset}    id=reset
${locator_error_firstname}    id=error-firstname

*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Data for register pass
    Input Text    ${locator_firstname}    สิทธิพล
    Input Text    ${locator_lastname}    เหลืองรุ่งทรัพย์
    Input Text    ${locator_email}    sittipol@gmail.com
    Input Text    ${locator_password}    123456789
    Input Text    ${locator_phone_number}    0123456789
    Select Radio Button    ${locator_gender}    female
    Select Checkbox    ${locator_checkbox_sql}
    Select Checkbox    ${locator_check_manual} 
    Select Checkbox    ${locator_check_auto} 
    Select Checkbox    ${locator_check_auto_2}
    Select List Nationality
    Select List role
    Select List plan
    Click Element    ${locator_btn_signup}
    Wait Until Page Contains    Register Success    2s
    Click Element    ${locator_btn_ok}
    Wait Until Page Contains    Welcome to Kru P' Beam!    2s
    Wait Until Element Is Visible    ${locator_email}    2s

Input Data for register 
    Input Text    ${locator_firstname}    สิทธิพล
    Input Text    ${locator_lastname}    เหลืองรุ่งทรัพย์
    Input Text    ${locator_email}    sittipol@gmail.com
    Input Text    ${locator_password}    123456789
    Input Text    ${locator_phone_number}    0123456789


Input Data fail firstname 
    Input Text    ${locator_firstname}    ${EMPTY}
    Input Text    ${locator_lastname}    เหลืองรุ่งทรัพย์
    Input Text    ${locator_email}    sittipol@gmail.com
    Input Text    ${locator_password}    123456789
    Input Text    ${locator_phone_number}    0123456789
    Select Radio Button    ${locator_gender}    female
    Select Checkbox    ${locator_checkbox_sql}
    Select Checkbox    ${locator_check_manual} 
    Select Checkbox    ${locator_check_auto} 
    Select Checkbox    ${locator_check_auto_2}
    Select List Nationality
    Select List role
    Select List plan
    Click Element    ${locator_btn_signup}

Verify error msg firstname
    ${txt}=    Get Text    ${locator_error_firstname}
    Should Be Equal As Strings    ${txt}    This field is required
 
Select List Nationality
    Click Element    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_select_nation}   2s
    Click Element    ${locator_select_nation}

Select List role
    Click Element    ${locator_role}
    Wait Until Element Is Visible    ${locator_select_role}   2s
    Click Element    ${locator_select_role}

Select List plan
    Click Element    ${locator_plan}
    Wait Until Element Is Visible    ${locator_select_plan}   2s
    Click Element    ${locator_select_plan}

*** Test Cases ***

TC001-register-pass
    Open Web Browser
    Input Data for register pass
    Close Browser

TC002-reset-data
    Open Web Browser
    Input Data for register
    Click Element    ${locator_btn_reset}
    Close Browser

TC003-vetify-fail-firstname
    Open Web Browser
    Input Data fail firstname
    Verify error msg firstname
    Close Browser