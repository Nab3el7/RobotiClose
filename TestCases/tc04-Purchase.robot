*** Settings ***
Documentation     A test suite with a single test for Purchase intakes and file.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Metadata    Version        2.0
Library     SeleniumLibrary
Resource    ../Keywords/kIntake.robot
Resource    ../Keywords/kHome.robot

*** Test Cases ***
Purchase_Intake
    NewIntake

    Create P_Intake
    Log To Console    ${href}
    Sleep    5s

Property_Info
    Property-Info    78
    Sleep    5s

Purchase_Info
    Closing Date
    Click Element    ${CDatePick}
    Sleep    2s

    Requisition Date
    Click Element    ${RDatePick}
    Sleep    2s

Buyer_Lawyer_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Lawyer Info
    Sleep    2s

Client_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Set Selenium Implicit Wait    ${DELAY}
    Click Element    ${inC1Type}
    Wait Until Keyword Succeeds    10x    5s    ${inC1Type}
    Click Element    ${inC1TypeDrop}
    Wait Until Element Is Visible    ${inC1RN}
    Click Element    ${inC1RN}

    Client0-Info

Seller_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Set Focus To Element    ${inS1Type}
    Click Element    ${inS1Type}
#    ---Select from drop down
    Click Element    ${inS1TypeDrop}
    Seller0-Info

Money_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Set Focus To Element    ${MHeading}
    Money-Info

Save_Intake
    Click Button    ${intakeSave}
    Set Selenium Implicit Wait    5s
    ${FURL}=    Get Location
    Log To Console    ${FURL}
#    Sleep    15s
    Wait Until Element Is Visible    ${AddIntake}
    Wait Until Element Is Enabled    ${AddIntake}

    [Teardown]      Close Browser