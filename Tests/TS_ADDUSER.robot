*** Settings ***
Library           SeleniumLibrary
 
Test Teardown     Close Browser
Test Tags         AddUser

*** Variables ***
${URL}                        https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewEmployeeList
${BROWSER}                    chrome
 


*** Test Cases ***
User User Case
    [Documentation]
    ...    0) Exercices sur le site orangeHRM
    ...    1) Ajout d'un utilisateur
    ...    2) Contrôle supplémentaire
    ...    3) Recherche de l'utilisateur
    ...    3) Suppression de l'utilisateur
    ...    4) Contrôle supplémentaire
    ...   
