*** Settings ***

Library     SeleniumLibrary
Resource    ../Manifest.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
#    Login Page Should Be Open
    Go To Login Page

Go To Login Page
#    Go To    ${LOGIN URL}
    Location Should Be    ${LOGIN URL}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    iClose Ontario

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
#    Click Button    submit
    Click Button    css=.btn-login

Welcome Page Should Be Open
    Set Selenium Implicit Wait    5s
    Wait Until Element Is Visible    xapth=//*[contains(text(),'Online')]
    Location Should Be    ${WELCOME URL}
    Title Should Be    Home

#  For InValid Login
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
#    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
#   ---For InValid Login---