*** Settings ***
Library         RPA.Browser.Selenium
Library         RPA.core.notebook
Library         RPA.Robocorp.Vault
Library         String
Library         Process
Library         OperatingSystem
Task Teardown   Close All Browsers

*** Variables ***
${ROBOCORP_CLOUD}           https://cloud.robocorp.com
${GOOGLEAUTH_TITLE}         Sign in with Google
${GOOGLEAUTH_ID_NEXT}       //div[@id="identifierNext"]//button
${GOOGLEAUTH_PASSWD_NEXT}   //div[@id="passwordNext"]//button
${GOOGLEAUTH_TOTP_NEXT}     //div[@id="totpNext"]//button


*** Tasks ***
Complete Control Room Google Sign-In
    Open Available Browser     ${CONTROL_ROOM}
    Complete Google Signin
    Wait Until Page Contains   Welcome Mika!
    Capture Page Screenshot


*** Keywords ***
Input text and proceed
    [Arguments]   ${element}  ${text}
    Wait until page contains element  ${element}
    Input Text      ${element}  ${text}

Get Authenticator Code
    [Documentation]  Authenticator needs to be set up for Google account
    [Arguments]     ${googleuser}  ${passphrase}
    ${curr_path}=   Replace String    ${CURDIR}    /    \\/
    ${result}=      Run Process     echo ${passphrase} | authenticator --data ${curr_path}\\/authdata generate --refresh once   shell=TRUE
    ${match}        Get Regexp Matches   ${result.stdout}  ${googleuser}: ([\\d]{6})  1
    Notebook Print  MATCH: ${match}[0]
    [Return]        ${match}[0]

Complete Google Signin
    [Arguments]     ${startelement}=link=Sign in with Google
    ${secret}       Get Secret   gmail
    Wait until page contains element  ${startelement}
    Click Element   ${startelement}
    Switch window   ${GOOGLEAUTH_TITLE}
    Input Text      //input[@type="email"]     ${secret}[account_user]
    Click Button    ${GOOGLEAUTH_ID_NEXT}
    Input text and proceed  //input[@type="password"]  ${secret}[account_password]
    Click Button    ${GOOGLEAUTH_PASSWD_NEXT}
    ${code}         Get Authenticator Code  ${secret}[account_user]  ${secret}[authenticator_passphrase]
    Input text and proceed  //input[@type="tel"]  ${code}
    Click Button    ${GOOGLEAUTH_TOTP_NEXT}