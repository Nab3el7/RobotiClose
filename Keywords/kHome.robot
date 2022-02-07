*** Settings ***
Documentation     This file is use for home page with reusable keywords.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Library         SeleniumLibrary
Resource        ../Variables/vHome.robot

*** Keywords ***
NewIntake
    Wait Until Element Is Visible    ${AddIntake}
    Click Element    ${AddIntake}

Create S_Intake
    Click Element    ${Sale Intake}
#    Capture Page Screenshot

Sale Intake
    ${url}=    Execute Javascript  return  window.location.href;
    Set Selenium Implicit Wait    5s
    Capture Page Screenshot

Create P_Intake
    Click Element    ${Purchase Intake}
    Sleep    3s
    ${href}=    Execute Javascript  return  window.location.href;

For New File
    @{NewFile}=     Get WebElement    ${AddIntake}