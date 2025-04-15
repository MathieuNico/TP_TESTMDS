*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             Collections

Test Setup          Ouvrir SeleniumEasy
Test Teardown       Fermer SeleniumEasy

Test Tags           admin

*** Variables ***
${URL}              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Test Cases ***
Test 01 Login
    [Tags]    admin_01
    [Documentation]    ...    ${\n}Présentation Exercice
    ...    ${\n}EXERCICE : Se connecter sur le site
    ...    ${\n}Vérifier que le message de connexion est bien affiché
    # Naviguer vers
    # SeleniumLibrary.Click Element    //ul[@id='treemenu']//a[text()='Admin']
    # SeleniumLibrary.Click Element    //ul[@id='treemenu']//a[text()='Login']
    # CODE A IMPLEMENTER ICI
    # Vérifier que le message de connexion est bien affiché
    ${username}   set variable   Admin
    ${password}   set variable   admin123
    Input Text    id=sum1   ${username}
    Input Text    id=sum2   ${password}
    Click Element    xpath=//button[contains(.,"Get Total")]
    Wait Until Element Contains   id=displayvalue   ${${sum1}+${sum2}}