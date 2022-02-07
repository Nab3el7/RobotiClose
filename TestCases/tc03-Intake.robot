*** Settings ***
Documentation     A test suite with a single test for intakes.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Metadata    Version        2.0
Library     SeleniumLibrary
Library    Process
Resource    ../Keywords/kIntake.robot
Resource    ../Keywords/kHome.robot

*** Test Cases ***
Sale_Intake
    NewIntake

    Create S_Intake
    ${url}=     Get Location
    Log To Console    ${url}
    Sleep    5s
    Location Should Be    ${SaleIntakeURL}

Property_Info
    Property-Info    78
    Sleep    5s

Sales_Info
    Closing Date
    Click Element    ${CDatePick}
#    ${CDate}   Get Element Attribute    ${CDatePick}    value
#    Should Be Equal As Strings    ${CDate}  September 17, 2021
    Sleep    2s

    Requisition Date
    Click Element    ${RDatePick}
#    ${RDate}   Get Element Attribute    ${RDatePick}    value
#    Should Be Equal As Strings    ${RDate}  September 16, 2021
    Sleep    2s

Seller_Lawyer_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Lawyer Info
    Sleep    2s

Client_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
#    Set Selenium Speed    ${DELAY}
    Click Element    ${inC1Type}
    Click Element    ${inC1TypeDrop}
    Wait Until Element Is Visible    ${inC1RN}
    Click Element    ${inC1RN}

    Client0-Info

#    Wait Until Element Is Visible    ${inC1Female}
#    Click Element    ${inC1Female}

Buyer-Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Set Focus To Element    ${inB1Type}
    Click Element    ${inB1Type}
#    ---Select from drop down
    Click Element    ${inB1TypeDrop}
    Buyer0-Info

Money_Info
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
#    Scroll Element Into View    ${MHeading}
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

#    [Teardown]    Close Browser