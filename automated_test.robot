*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://codenboxautomationlab.com/practice/
${browser}    chrome
${autocomplete_value_txt}    Thai
${locator_radio_button}    //*[@id="radio-btn-example"]/fieldset/label[2]/input
${locator_autocomplete}    autocomplete
${select_thailand_txt}    //*[text()='Thailand']
${locator_static_dropdown_list}    //*[@id="post-501"]/div/div[1]/div[3]/fieldset/legend
${locator_select_stastic_dropdown_list}    dropdown-class-example
${locator_checkbox_menu}    //*[@id="checkbox-example"]/fieldset/label[1]
${locator_wait_mouse_hover}    //*[@id="post-501"]/header/h1
${locator_scroll_mouse_hover}    //*[@id="post-501"]/div/div[5]/fieldset/legend
${locator_mouse_hover}    //*[@id="mousehover"]

*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

*** Test Cases ***

Testcases_Automate
### step1 Open Web Browser
    [Setup]    Open Web Browser
### step 2 Select Radio Button 2
    Wait Until Element Is Visible    xpath=${locator_radio_button}    2s
    Select Radio Button    radioButton    radio2
### step 3 Auto Complete
    Wait Until Element Is Visible    id=${locator_autocomplete}    2s
    Input Text    id=${locator_autocomplete}    ${autocomplete_value_txt}
    Click Element    xpath=${select_thailand_txt}
### step 4 Select Drop Down List
    Wait Until Element Is Visible    xpath=${locator_static_dropdown_list}    2s
    Select From List By Label   id=${locator_select_stastic_dropdown_list}    Appium
### step 5 Check Option 1 and Option 3
    Wait Until Element Is Visible    xpath=${locator_checkbox_menu}   2s
    Select Checkbox    checkBoxOption1
    Select Checkbox    checkBoxOption3
### step 6 Mouse Hover
    Wait Until Element Is Visible    xpath=${locator_mouse_hover}    2s
    Scroll Element Into View    xpath=${locator_scroll_mouse_hover}
    Mouse Over    xpath=${locator_mouse_hover}
    [Teardown]    Close Browser