*** Settings ***
Documentation     This file with reusable keywords and variables.
...               For intake creations

Library         SeleniumLibrary

*** Variables ***
#Open Dropdown
${AddIntake}        xpath=//footer//*[contains(@class,'icon-icon_add')]

#Sale Intake
${Sale Intake}      xpath=//*[contains(@class,'addmenu')]//*[@role='menuitem']//a[contains(text(),'Sale')]
${Purchase Intake}  xpath=//*[contains(@class,'addmenu')]//*[@role='menuitem']//a[contains(text(),'Purchase')]
${Mortgage Intake}  xpath=//*[contains(@class,'addmenu')]//*[@role='menuitem']//a[contains(text(),'Mortgage')]
${TTransfer Intake}  xpath=//*[contains(@class,'addmenu')]//*[@role='menuitem']//a[contains(text(),'Title Transfer')]
${Assignor Intake}  xpath=//*[contains(@class,'addmenu')]//*[@role='menuitem']//a[contains(text(),'Assignment – Assignor (original buyer)')]
${Assignee Intake}  xpath=//*[contains(@class,'addmenu')]//*[@role='menuitem']//a[contains(text(),'Assignment – Assignee (new buyer)')]