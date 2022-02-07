*** Settings ***
Documentation       The vCredentials file with reusable keywords and variables.
...
...                 The system specific keywords created here form our own
...                 domain specific language. They utilize keywords provided
...                 by the imported SeleniumLibrary.

Library     SeleniumLibrary

*** Variables ***
${SERVER}           https://refactorui.dev.iclose.ca/iclose
${BROWSER}          Firefox
${DELAY}            1s
${Wait}             2s
${LOGIN URL}        ${SERVER}/#/auth/login?returnUrl=%2Fhome
${WELCOME URL}      ${SERVER}/#/home
${SaleIntakeURL}    ${SERVER}/#/propertysale/sales
${PurchIntakeURL}   ${SERVER}/#/propertypurchase/purchase
${SaleFileURL}      ${SERVER}/#/propertysale/files
${PurchFileURL}     ${SERVER}/#/propertypurchase/files