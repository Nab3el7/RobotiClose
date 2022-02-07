*** Settings ***
Documentation       A test suite for login.
...
...                 The system specific keywords created here form our own
...                 domain specific language. They utilize keywords provided
...                 by the imported SeleniumLibrary.

Library     SeleniumLibrary

*** Variables ***
#Login Credentials
${email}            superadmin@iclose.ca
${password}         P@55w0rd@

