*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}          https://www.daraz.pk/
${BROWSER}      Firefox
${DELAY}        2s
${SearchItem}   Hats For Men
${ItemName}     Beanie Full Set-2 Piece Cap + Neck Warmer/Hat & Warmer/Topi Hat Cap Neck Warmer Muffler Beanie Cap Neck Warmer

${SearchField}      xpath=//*[@id='q']/..//input
${SearchButton}     xpath=//*[@class='search-box__button--1oH7']/..//button
#Get Search Item in Array
${AddItem}          xpath=//*[@class='c2prKC'][1]

${AddToCart}        xpath=//*[@id='module_add_to_cart']/..//button//*[contains(text(),'Add to Cart')]
${Cart}             xpath=//*[@id='cart']
${AddedItem}        xpath=//*[@class='cart-item'][1]
${ItemDelete}       xpath=//*[@class='automation-btn-delete']
${AlertOpen}        xpath=//*[@role="alertdialog"]
${AlertRemove}      xpath=//*[@role="alertdialog"]//*[@id='dialog-footer-8']//*[contains(text(),'REMOVE')]

*** Test Cases ***
SearchItem
    Open Browser To Daraz
    Input Search    ${searchItem}
    Search Item
    Wait Until Element Is Visible    ${AddItem}
    Wait Until Element Is Enabled    ${AddItem}

AddSearchItem
    Click Element    ${AddItem}
    Click Element    ${AddToCart}
    Sleep    ${DELAY}
    Click Element    ${Cart}
    Element Text Should Be    ${AddedItem}      ${ItemName}
    Click Element    ${ItemDelete}
    Wait Until Element Is Visible   ${AlertOpen}    timeout=5
    Click Element  ${AlertRemove}
    Handle Alert  action=ACCEPT
    Element Text Should Be  ${AlertRemove}      REMOVE

    [Teardown]      Close Browser

*** Keywords ***
Open Browser To Daraz
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Go To Daraz Page

Go To Daraz Page
    Location Should Be    ${URL}
    Page Should Be Open

Page Should Be Open
    Title Should Be    Online Shopping in Pakistan: Fashion, Electronics & Books - Daraz.pk

Input Search
    [Arguments]    ${searchname}
    Input Text    ${SearchField}    ${searchname}

Search Item
    Click Button    ${SearchButton}