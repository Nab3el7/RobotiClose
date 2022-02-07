*** Settings ***
Documentation     This file with reusable variables.
...               For intake creations
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Library           SeleniumLibrary
Library           Collections

*** Variables ***
${CType1}           Client
${CType2}           Cooperation
${CType3}           ClientAttorny
${CType4}           Estate

#Common Indexes
${DOBPreYear}       xapth=//*[@class='header']//*[@aria-label='Previous Year']/..//button
${DOBPicker}        xapth=//*[@tabindex='0']//*[@class='datevalue currmonth']//*[text()=14]

#Sales Info ...Common
    #Closing Date
${ClosingDate}      xpath=//*[@formcontrolname="ClosingDate"]
${cNext}            xpath=//*[@formcontrolname="ClosingDate"]/..//button[@title="Next month"]
${CDatePick}        xpath=//*[@role='gridcell']//*[@ngbdatepickerdayview][text()=17]
    #Requisition Date
${RequisitDate}     xpath=//*[@formcontrolname="RequisitionDate"]
${rNext}            xpath=//*[@formcontrolname="RequisitionDate"]/..//button[@title="Next month"]
${RDatePick}        xpath=//*[@role='gridcell']//*[@ngbdatepickerdayview][text()=16]

#Seller Lawyer Info ...Common
${sLawyer}          //*[@id="openingInfo"]//*[@formcontrolname='Lawyer']
${sLawyerDrop}      //*[@id="openingInfo"]//*[@formcontrolname='Lawyer']//*[@role='option'][3]
${sClerk}           //*[@id="openingInfo"]//*[@formcontrolname='Clerk']
${sClerkDrop}       //*[@id="openingInfo"]//*[@formcontrolname='Clerk']//*[@role='option'][2]

#Property Info ...Common
${instProType}      //*[@id='PropertyInfoSection']//*[@formcontrolname='PropertyType']//*[@role='option'][1]
${instPRYes}        //*[@id='PropertyInfoSection']//*[@id="rdbtnPRYes"]
${instPRNo}         //*[@id='PropertyInfoSection']//*[@id="rdbtnPRNo"]
${instUnit}         //*[@id='PropertyInfoSection']//*[@formcontrolname='unitNo']
${instMLS}          //*[@id='PropertyInfoSection']//*[@formcontrolname='MLS']
${instName}         //*[@id='PropertyInfoSection']//label[@for='streetName']/../input
${instDrop}         xpath=//*[@class='pac-item'][3]
${instCity}         //*[@id='PropertyInfoSection']//*[@formcontrolname='City']
${instCDrop}        //*[@id='PropertyInfoSection']//*[@formcontrolname='City']//*[@role='option'][2]
${instProvince}     //*[@id='PropertyInfoSection']//*[@formcontrolname='Province']
${instPDrop}        //*[@id='PropertyInfoSection']//*[@formcontrolname='Province']//*[@role='option'][3]

#Intake Clients ...Common
        # [@id="Cliemt0"]==>1st Client || [@id="Cliemt1"]==>2nd Client  ..... and so on
${inC1Type}         //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='Type']
${inC1TypeDrop}     //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='Type']//*[@value='${CType1}']
${inC1RY}           //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@id="rdbtnFSBOYes"]
${inC1RN}           //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@id="rdbtnFSBONo"]
${inC1FName}        //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='FirstName']/..//input
${inC1LName}        //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='Surname']/..//input
${inC1MName}        //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='MiddleName']/..//input
${inC1DOBinput}     //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@aria-label='Date input field']
${inC1DOB}          //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@aria-label='Date input field']/..//button
${inC1Spousal}      //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@id="ddlClientSpousesStatus"]
${inC1SpousalDrop}  //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@id="ddlClientSpousesStatus"]//option[2]
${inC1Male}         //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@class='radio-inline']/..//label[contains(text(), "Male")]
${inC1Female}       //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@class='radio-inline']/..//label[contains(text(), "Female")]
${inC1Hphone}       //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='HomePhone']/..//input
${inC1Wphone}       //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='WorkPhone']/..//input
${inC1Cphone}       //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='CellPhone']/..//input
${inC1Email}        //*[@formarrayname="Clients"]//*[@id="Client0"]//*[@formcontrolname='Email']

#Intake Buyers "Sale"
${inB1Type}         //*[@id="Buyer0"]//*[@formcontrolname='Type']
${inB1TypeDrop}     //*[@id="Buyer0"]//*[@formcontrolname='Type']//*[@value='${CType1}']
${inB1ResidYes}     //*[@id='Buyer0']//*[@id="rdbtnFSBOYes"]
${inB1residNo}      //*[@id='Buyer0']//*[@id="rdbtnFSBONo"]
${inB1FName}        //*[@id="Buyer0"]//*[@formcontrolname='FirstName']/..//input
${inB1LName}        //*[@id="Buyer0"]//*[@formcontrolname='Surname']/..//input
${inB1MName}        //*[@id="Buyer0"]//*[@formcontrolname='MiddleName']/..//input
${inB1Male}         //*[@id="Buyer0"]//*[@class='radio-inline']/..//label[contains(text(), "Male")]
${inB1Fmale}        //*[@id="Buyer0"]//*[@class='radio-inline']/..//label[contains(text(), "Female")]

#Intake Money ...Common
${MHeading}         //*[@id='moneySection']//*[contains(text(), 'Money')]
${inPrice}          //*[@id='moneySection']//*[contains(text(), 'Purchase Price')]/..//input
${inPromoCode}      //*[@id='moneySection']//*[@formcontrolname='promoCode']
${inPromoCodeList}  //*[@id='moneySection']//*[@formcontrolname="promoCode"]//*[@role='option'][2]
${inDeposit1}       //*[@id='frc-money.deposit1-1088']/..//input
${inDepositLB}      //*[@id='moneySection']//*[@class='radio-inline']/..//label[contains(text(), "Listing Brokerage")]

#Law Firm Info Lawyer
${inLawyerName}     //*[@id='editOtherLaw']//*[@formcontrolname='Name']/..//input
${inLawyerList}     //*[@id='editOtherLaw']//*[@formcontrolname='Name']//*[@role="option"][1]

#Intake Buyers "Purchase"
${inS1Type}         //*[@id="Sellers0"]//*[@formcontrolname='Type']
${inS1TypeDrop}     //*[@id="Sellers0"]//*[@formcontrolname='Type']//*[@value='${CType1}']
${inS1ResidYes}     //*[@id='Sellers0']//*[@id="rdbtnFSBOYes"]
${inS1residNo}      //*[@id='Sellers0']//*[@id="rdbtnFSBONo"]
${inS1FName}        //*[@id="Sellers0"]//*[@formcontrolname='FirstName']/..//input
${inS1LName}        //*[@id="Sellers0"]//*[@formcontrolname='Surname']/..//input
${inS1MName}        //*[@id="Sellers0"]//*[@formcontrolname='MiddleName']/..//input
${inS1Male}         //*[@id="Sellers0"]//*[@class='radio-inline']/..//label[contains(text(), "Male")]
${inS1Fmale}        //*[@id="Sellers0"]//*[@class='radio-inline']/..//label[contains(text(), "Female")]

#Intake Save Button
${intakeSave}       xpath=//*[contains(@class,'btn-save')]/..//button