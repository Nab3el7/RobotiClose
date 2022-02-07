*** Settings ***
Documentation       A test case for valid login.

Metadata    Version        2.0
Library     SeleniumLibrary
Resource    ../Variables/vCredentials.robot
Resource    ../Keywords/kLogin.robot

*** Test Cases ***
ValidLogin
    Open Browser To Login Page
    Input Username    ${email}
    Input Password    ${password}
    Submit Credentials
    Set Selenium Implicit Wait    5s
#    Welcome Page Should Be Open

#    [Teardown]      Close Browser