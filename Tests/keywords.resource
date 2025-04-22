*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}        chrome
${USERNAME}       Admin
${PASSWORDADMIN}  admin123
${USER}           TestUser249
${PASSWORD}       TestUser123
${EMPLOYEE}       Tom Greg Poitier

*** Keywords ***

Given Open Browser
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

When Create User
    Create User

Then Verify User Created
    [Arguments]    ${USER}
    Verify User Created    ${USER}

Create User
    Wait Until Element Is Visible    name=username    10s
    Input Text   name=username   ${USERNAME}
    Input Text   name=password   ${PASSWORDADMIN}
    Click Element   xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    10s    
    Click Element    xpath=//span[text()="Admin"]/ancestor::a
    Wait Until Element Is Visible    xpath=//h5[text()='System Users']    10s
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--secondary']
    Wait Until Element Is Visible    xpath=//h6[text()='Add User']    10s
    Click Element    (//div[contains(@class,"oxd-select-text") and .//div[text()="-- Select --"]])[1]
    Wait Until Element Is Visible    xpath=//div[@role="option" and .//span[normalize-space(.)="Admin"]]    timeout=5s
    Click Element    xpath=//div[@role="option" and .//span[normalize-space(.)="Admin"]]
    Input Text    xpath=//input[@placeholder="Type for hints..."]    ${EMPLOYEE}
    Wait Until Element Is Visible    xpath=//div[@role="option" and contains(normalize-space(.), "${EMPLOYEE}")]    timeout=10s
    Click Element   xpath=//div[@role="option" and .//span[normalize-space(.)="${EMPLOYEE}"]]
    Click Element    xpath=(//div[contains(@class,"oxd-select-text") and .//div[text()="-- Select --"]])[1]
    Wait Until Element Is Visible    xpath=//div[@role="option" and .//span[normalize-space(.)="Enabled"]]    timeout=5s
    Click Element    xpath=//div[@role="option" and .//span[normalize-space(.)="Enabled"]]
    Input Text    xpath=//label[normalize-space(text())="Username"]/following::input[1]    ${USER}
    Input Text    xpath=//label[text()="Password"]/following::input[1]    ${PASSWORD}
    Input Text    xpath=//label[text()="Confirm Password"]/following::input[1]    ${PASSWORD}
    Click Element    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h5[text()='System Users']    10s

Verify User Created
    [Arguments]    ${USER}   
    Wait Until Element Is Visible    xpath=//h5[text()='System Users']    10s
    Input Text   xpath=//input[@class="oxd-input oxd-input--active"]    ${USER}
    Click Element    xpath=//button[@type='submit']
    Wait Until Page Contains    ${USER}    10s
