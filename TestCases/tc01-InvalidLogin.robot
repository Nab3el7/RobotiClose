*** Settings ***
Documentation       A test suite containing tests related to invalid login.
...
...                 These tests are data-driven by their nature. They use a single
...                 keyword, specified with Test Template setting, that is called
...                 with different arguments to cover different scenarios.
...
...                 This suite also demonstrates using setups and teardowns in
...                 different levels.

Resource            ../Variables/vCredentials.robot
Resource            ../Keywords/kLogin.robot
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Browser
Test Template       Login With Invalid Credentials Should Fail


*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${password}
Invalid Password                 ${email}         invalid
#Invalid Username And Password    invalid          whatever
#Empty Username                   ${EMPTY}         ${password}
Empty Password                   ${email}         ${EMPTY}
#Empty Username And Password      ${EMPTY}         ${EMPTY}

CloseBrowser
    [Teardown]      Close Browser