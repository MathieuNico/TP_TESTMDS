*** Settings ***
Library           SeleniumLibrary
 
Test Teardown     Close Browser
Test Tags         AddUser
Resource         keywords.resource
*** Variables ***
${TEST}      TestUser249




*** Test Cases ***
User User Case  
    Given Open Browser    ${URL}    ${BROWSER}
    When Create User
    Then Verify User Created    ${TEST}    


        

