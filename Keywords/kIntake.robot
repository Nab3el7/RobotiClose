*** Settings ***
Documentation     This file is use for intakes with reusable keywords.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Library         SeleniumLibrary
Resource        ../TestData.robot
Resource        ../Manifest.robot
Resource        ../Variables/vIntake.robot

*** Keywords ***
#Common Component "Closing & Requisition Date"
Closing Date
    Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible    ${ClosingDate}
    Click Element    ${ClosingDate}
    Wait Until Element Is Visible    ${cNext}
    Click Element    ${cNext}
    Wait Until Element Is Visible    ${CDatePick}

Requisition Date
    Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible    ${RequisitDate}
    Click Element    ${RequisitDate}
    Wait Until Element Is Visible    ${rNext}
    Click Element    ${rNext}
    Wait Until Element Is Visible    ${RDatePick}

#Commom Component "Lawyer Info"
Lawyer Info
    Wait Until Element Is Visible    ${sLawyer}
    Click Element    ${sLawyer}
    Click Element    ${sLawyerDrop}
    Set Selenium Implicit Wait    ${Wait}
    Wait Until Element Is Visible    ${sClerk}
    Click Element    ${sClerk}
    Click Element    ${sClerkDrop}

#Common Component "Propert Info"
Property-Info
    [Arguments]     ${Street}
    Set Selenium Implicit Wait    ${Wait}
    Click Element    ${instName}
    Input Text    ${instName}   ${Street}
    Sleep    2s
    Wait Until Element Is Visible    ${instDrop}
    Click Element    ${instDrop}

#Common Component "Client0 Info"
Client0-Info
#    Set Selenium Implicit Wait    ${Wait}
    Click Element    ${inC1FName}
    Input Text    ${inC1FName}      ${C1FName}
    Click Element    ${inC1LName}
    Input Text    ${inC1LName}      ${C1LName}
    Click Element    ${inC1MName}
    Input Text    ${inC1MName}      ${C1MName}
    Click Element    ${inC1Hphone}
    Input Text    ${inC1Hphone}     ${C1Hphone}
    Click Element    ${inC1Wphone}
    Input Text    ${inC1Wphone}     ${C1Wphone}
    Click Element    ${inC1Cphone}
    Input Text    ${inC1Cphone}     ${C1Cphone}
    Click Element    ${inC1Email}
    Input Text    ${inC1Email}      ${C1Email}
#    Click Element    ${inC1DOBinput}
#    Click Button    ${inC1DOB}
#    Click Element    ${DOBPreYear}
#    Click Element    ${DOBPicker}

#Common Component "Buyer0 Info"  //Sale File
Buyer0-Info
    Set Selenium Implicit Wait    ${Wait}
    Click Element    ${inB1FName}
    Input Text    ${inB1FName}      ${B1FName}
    Click Element    ${inB1LName}
    Input Text    ${inB1LName}      ${B1LName}
    Click Element    ${inB1MName}
    Input Text    ${inB1MName}      ${B1MName}

#    -------End-------

#Sale File "Money Component"
Money-Info
    Click Element    ${inPrice}
    Input Text    ${inPrice}        ${pPrice}
    Click Element    ${inDeposit1}
    Input Text    ${inDeposit1}     ${Deposit1}

#Common Component "Buyer0 Info"  //Purchase File
Seller0-Info
    Set Selenium Implicit Wait    ${Wait}
    Click Element    ${inS1FName}
    Input Text    ${inS1FName}      ${S1FName}
    Click Element    ${inS1LName}
    Input Text    ${inS1LName}      ${S1LName}
    Click Element    ${inS1MName}
    Input Text    ${inS1MName}      ${S1MName}

#    -------End-------