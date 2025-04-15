*** Settings ***
Library           SeleniumLibrary
 
Test Teardown     Close Browser
Test Tags         tnr
 
 
*** Variables ***
${URL}                        https://todomvc.com/examples/angular/dist/browser/#/all
${BROWSER}                    chrome
# Locators - Page Object Model
${LOCATOR_TITLE}             css:h1
${LOCATOR_INPUT_NEWTODO}     css:input.new-todo
${LOCATOR_TODO_LIST}         css:ul.todo-list li
${LOCATOR_BUTTON_CLEAR}      css:button.clear-completed
 
 
*** Test Cases ***
Scenario TODO
    [Documentation]
    ...    0) Exercices sur le site angular
    ...    1) Ajout de 3 todos
    ...    2) Traitement d'une tâche
    ...    3) Suppression d'une tâche
    ...    4) Contrôle supplémentaire
    Launch Todo
    Capture Page Screenshot    ${OUTPUT_DIR}/step01-initial.png
    Add Todo    SELENIUM
    Add Todo    APPIUM
    Add Todo    PYTHON
    Capture Page Screenshot    ${OUTPUT_DIR}/step02-addTodo.png
    Complete Todo    APPIUM
    Capture Page Screenshot    ${OUTPUT_DIR}/step03-completeTodo.png
    Clear Completed
    Capture Page Screenshot    ${OUTPUT_DIR}/step04-clearTodo.png
    Delete Todo    PYTHON
    Capture Page Screenshot    ${OUTPUT_DIR}/step05-deleteTodo.png
    Verify Todo Exists    SELENIUM
    Verify Todo Not Exists    APPIUM
    Verify Todo Not Exists    PYTHON
 
 
*** Keywords ***
Launch Todo
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Location Contains    angular
    Wait Until Element Contains    ${LOCATOR_TITLE}    Todos    timeout=5s
 
Add Todo
    [Arguments]    ${todo_name}
    Input Text    ${LOCATOR_INPUT_NEWTODO}    ${todo_name}
    Press Keys    ${LOCATOR_INPUT_NEWTODO}    RETURN
    Wait Until Page Contains    ${todo_name}
 
Complete Todo
    [Arguments]    ${todo_name}
    Click Element    xpath=//label[text()='${todo_name}']/../input[@type='checkbox']
    Sleep    1s
 
Clear Completed
    Click Button    ${LOCATOR_BUTTON_CLEAR}
    Sleep    1s
 
Delete Todo
    [Arguments]    ${todo_name}
    Mouse Over    xpath=//label[text()='${todo_name}']
    Click Element    xpath=//label[text()='${todo_name}']/following-sibling::button
 
Verify Todo Exists
    [Arguments]    ${todo_name}
    Page Should Contain Element    xpath=//label[text()='${todo_name}']
 
Verify Todo Not Exists
    [Arguments]    ${todo_name}
    Page Should Not Contain Element    xpath=//label[text()='${todo_name}']