*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             Collections

*** Variables ***
${URL}              https://opensource-demo.orangehrmlive.com
${BROWSER}          chrome
${USERNAME}         Admin
${PASSWORD}         admin123

*** Test Cases ***
Test 01 Login
    [Tags]    admin_01
    [Documentation]    
    ...    Présentation Exercice
    ...    EXERCICE : Se connecter sur le site
    ...    Vérifier que le message de connexion est bien affiché

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']

    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    10s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    [Teardown]    Close Browser
