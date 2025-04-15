*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             Collections

Test Tags           admin


*** Variables ***
${URL}              https://opensource-demo.orangehrmlive.com
${BROWSER}          chrome
${USERNAME}         Admin
${PASSWORD}         admin123
${FIRSTNAME}         Tom
${MIDDLENAME}         Greg
${LASTNAME}         Poitier
${EMPLOYEENAME}         Tom Greg Poitier


*** Test Cases ***
Test 01 Login
    [Tags]    admin01
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

    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    [Teardown]    Close Browser

Test 02 Add Admin
    [Tags]    admin02
    [Documentation] 
    ...    Présentation Exercice
    ...    EXERCICE : Créer un admin
    ...    Vérifier que l/'admin est bien affiché
    ...    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[text()='PIM']

    Wait Until Element Is Visible    xpath=//button[contains(@class,'oxd-button') and contains(.,'Add')]    timeout=10s
    Click Button    xpath=//button[contains(@class,'oxd-button') and contains(.,'Add')]

    Wait Until Element Is Visible    name=firstName    timeout=10s
    Input Text    name=firstName    ${FIRSTNAME}
    Input Text    name=middleName    ${MIDDLENAME}
    Input Text    name=lastName    ${LASTNAME}

    Wait Until Element Is Visible    xpath=//p[text()='Create Login Details']/following::span[contains(@class,'oxd-switch-input')][1]    timeout=5s
    Click Element                    xpath=//p[text()='Create Login Details']/following::span[contains(@class,'oxd-switch-input')][1]




Test 03 search admin
    [Tags]    admin03
    [Documentation] 
    ...    Présentation Exercice
    ...    EXERCICE : rechercher un admin
    ...    Vérifier que l/'admin est bien affiché
    ...    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[text()='PIM']

    Wait Until Element Is Visible    xpath=//button[contains(@class,'oxd-button') and contains(.,'Add')]    timeout=10s
    Click Button    xpath=//button[contains(@class,'oxd-button') and contains(.,'Add')]

    Wait Until Element Is Visible    name=firstName    timeout=10s
    Input Text    name=firstName    ${FIRSTNAME}
    Input Text    name=middleName    ${MIDDLENAME}
    Input Text    name=lastName    ${LASTNAME}
    Click Button     xpath=//button[@type='submit']

    Click Element    xpath=//span[text()='PIM']

    Wait Until Element Is Visible    xpath=//div[contains(@class,'oxd-table-filter-header-options')]    10s
    Click Button    xpath=//div[contains(@class,'oxd-table-filter-header-options')]

    Wait Until Element Is Visible    xpath=(//div[@class='oxd-form-row']//input)[1]    10s
    Input Text    xpath=(//div[@class='oxd-form-row']//input)[1]    ${EMPLOYEENAME}

    Wait Until Element Is Visible    xpath=//form//button[contains(@class, 'orangehrm-left-space')]    10s
    Click Button    xpath=//form//button[contains(@class, 'orangehrm-left-space')]



# test 04 update admin
# Test 04 delete admin