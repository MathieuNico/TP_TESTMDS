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
${FIRSTNAME}        Tom
${MIDDLENAME}       Greg
${LASTNAME}         Poitier
${EMPLOYEENAME}     Tom Greg Poitier
${ID}               6667


*** Test Cases ***
Test 01 Login
    [Tags]    admin01
    [Documentation]    
    ...    Présentation Exercice
    ...    EXERCICE : Se connecter sur le site
    ...    Étapes :
    ...    - Ouvrir le navigateur
    ...    - Renseigner les identifiants de connexion
    ...    - Valider et vérifier l'accès au tableau de bord

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[contains(@class, 'oxd-userdropdown-tab')]
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'logout')]    timeout=5s
    Click Element    xpath=//a[contains(@href, 'logout')]

    sleep    10s

    [Teardown]    Close Browser

Test 02 Add Admin
    [Tags]    admin02
    [Documentation] 
    ...    Présentation Exercice
    ...    EXERCICE : Créer un admin
    ...    Étapes :
    ...    - Connexion à l'application
    ...    - Navigation vers le menu PIM
    ...    - Ajout d'un nouvel utilisateur avec nom et prénom
    ...    - Vérification que l'ajout est réussi

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    timeout=30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[text()='PIM']

    Wait Until Element Is Visible    xpath=//button[contains(@class,'oxd-button') and contains(.,'Add')]    timeout=10s
    Click Button    xpath=//button[contains(@class,'oxd-button') and contains(.,'Add')]

    Wait Until Element Is Visible    name=firstName    timeout=10s
    Input Text    name=firstName    ${FIRSTNAME}
    Input Text    name=middleName    ${MIDDLENAME}
    Input Text    name=lastName    ${LASTNAME}

    # Wait Until Element Is Visible    xpath=//div[contains(@class, 'oxd-switch-wrapper')]//span[contains(@class, 'oxd-switch-input')]    10s
    # Click Element                    xpath=//div[contains(@class, 'oxd-switch-wrapper')]//span[contains(@class, 'oxd-switch-input')]
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Save']    timeout=10s
    Click button    xpath=//button[normalize-space()='Save']

    Sleep    10s
    Capture Page Screenshot

    Click Element    xpath=//span[contains(@class, 'oxd-userdropdown-tab')]
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'logout')]    timeout=5s
    Click Element    xpath=//a[contains(@href, 'logout')]

    sleep    10s

    [Teardown]    Close Browser

Test 03 search admin
    [Tags]    admin03
    [Documentation] 
    ...    Présentation Exercice
    ...    EXERCICE : rechercher un admin
    ...    Étapes :
    ...    - Connexion à l'application
    ...    - Accès à la section PIM
    ...    - Rechercher un utilisateur par nom complet
    ...    - Vérifier qu'il est affiché dans la liste

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[text()='PIM']

    Wait Until Element Is Visible    xpath=(//div[@class='oxd-form-row']//input)[1]    10s
    Input Text    xpath=(//div[@class='oxd-form-row']//input)[1]    ${EMPLOYEENAME}
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Search']    10s
    Click Button    xpath=//button[normalize-space()='Search']

    sleep    10s

    Click Element    xpath=//span[contains(@class, 'oxd-userdropdown-tab')]
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'logout')]    timeout=5s
    Click Element    xpath=//a[contains(@href, 'logout')]

    sleep    10s

    [Teardown]    Close Browser

test 04 update admin
    [Tags]    admin04
    [Documentation] 
    ...    Présentation Exercice
    ...    EXERCICE : modifier un admin
    ...    Étapes :
    ...    - Connexion et recherche de l'utilisateur
    ...    - Accès au formulaire d'édition
    ...    - Modification du champ Employee Id
    ...    - Sauvegarde des modifications

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[text()='PIM']

    Wait Until Element Is Visible    xpath=(//div[@class='oxd-form-row']//input)[1]    10s
    Input Text    xpath=(//div[@class='oxd-form-row']//input)[1]    ${EMPLOYEENAME}
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Search']    10s
    Click Button    xpath=//button[normalize-space()='Search']

    Wait Until Element Is Visible    xpath=//button[contains(@class, 'oxd-icon-button') and .//i[contains(@class, 'bi-pencil-fill')]]    timeout=10s
    Click Button    xpath=//button[contains(@class, 'oxd-icon-button') and .//i[contains(@class, 'bi-pencil-fill')]]
    sleep    5s

    Click Element          xpath=//label[normalize-space()='Employee Id']/following::input[1]
    sleep    3s

    Press Keys       xpath=//label[normalize-space()='Employee Id']/following::input[1]    BACKSPACE
    Press Keys       xpath=//label[normalize-space()='Employee Id']/following::input[1]    BACKSPACE
    Press Keys       xpath=//label[normalize-space()='Employee Id']/following::input[1]    BACKSPACE
    Press Keys       xpath=//label[normalize-space()='Employee Id']/following::input[1]    BACKSPACE
    Input Text             xpath=//label[normalize-space()='Employee Id']/following::input[1]    ${ID}
    Click Button    xpath=//div[contains(@class,'oxd-form-actions')]//button[normalize-space()='Save']

    sleep    10s

    Click Element    xpath=//span[contains(@class, 'oxd-userdropdown-tab')]
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'logout')]    timeout=5s
    Click Element    xpath=//a[contains(@href, 'logout')]

    sleep    10s

    [Teardown]    Close Browser

Test 05 delete admin
    [Tags]    admin05
    [Documentation] 
    ...    Présentation Exercice
    ...    EXERCICE : supprimer un admin
    ...    Étapes :
    ...    - Connexion et recherche d'un utilisateur
    ...    - Clic sur l'icône de suppression
    ...    - Confirmation de la suppression
    ...    - Vérification que l'utilisateur est bien supprimé

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    30s
    Element Should Be Visible       xpath=//h6[text()='Dashboard']

    Click Element    xpath=//span[text()='PIM']
    Wait Until Element Is Visible    xpath=(//div[@class='oxd-form-row']//input)[1]    10s
    Input Text    xpath=(//div[@class='oxd-form-row']//input)[1]    ${EMPLOYEENAME}
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Search']    10s
    Click Button    xpath=//button[normalize-space()='Search']

    Wait Until Element Is Visible    xpath=//button[contains(@class, 'oxd-icon-button') and .//i[contains(@class, 'bi-pencil-fill')]]    timeout=10s
    Click Button    xpath=//button[contains(@class, 'oxd-icon-button') and .//i[contains(@class, 'bi-trash')]]
    Click Button    xpath=//button[contains(@class,'oxd-button--label-danger') and contains(.,'Yes, Delete')]

    sleep    10s

    Click Element    xpath=//span[contains(@class, 'oxd-userdropdown-tab')]
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'logout')]    timeout=5s
    Click Element    xpath=//a[contains(@href, 'logout')]

    sleep    10s

    [Teardown]    Close Browser
