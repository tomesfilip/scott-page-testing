*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Cookies.robot
Resource  ../../Variables/ContactForm.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Contact}  ${Img_Scott_Logo}

*** Test Cases ***

TC_CF001 - Contact Layout
    Mouse Over And Click  ${Button_Close_Cookies_Modal}
    Compare Text  ${Headline_contact}  CONTACT
    Compare Text  ${Headline_Contact_Form}  CONTACT
    Element Should Be Disabled  ${Select_Type}
    Element Should Be Visible  ${Input_First_Name}
    Element Should Be Visible  ${Input_Last_Name}
    Element Should Be Visible  ${Input_Email}
    Element Should Be Visible  ${Textarea_Message}
    Element Should Be Visible  ${Label_Attachment}
    Scroll Element Into View  ${Button_Submit_Contact_Form}
    Element Should Be Disabled  ${Button_Submit_Contact_Form}
    Mouse Over And Click  ${Label_Privacy_Policy}
    Reload Page

TC_CF003 - Form Submit Without Gender
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    Type Text To Input  ${Input_First_Name}  John
    Type Text To Input  ${Input_Last_Name}  Doe
    Type Text To Input  ${Input_Email}  john@mail.com
    Type Text To Input  ${Textarea_Message}  this is a testing message, no need to answer
    Select From List By Index  ${Select_Country}  1
    Select From List By Index  ${Select_Type}  1
    Select From List By Index  ${Select_Division}  1
    Mouse Over And Click  ${Label_Privacy_Policy}
    Mouse Over And Click  ${Button_Submit_Contact_Form}
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    Check Styling  ${Select_Gender}  border  1px solid rgb(255, 64, 80)
    Compare Text  ${Error_Message}  Select your gender
    Go To  ${URL_Scott_Contact}

TC_CF004 - Form Submit Big File Size
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    Type Text To Input  ${Input_First_Name}  John
    Type Text To Input  ${Input_Last_Name}  Doe
    Type Text To Input  ${Input_Email}  john@mail.com
    Type Text To Input  ${Textarea_Message}  this is a testing message, no need to answer
    Select From List By Index  ${Select_Gender}  1
    Select From List By Index  ${Select_Country}  1
    Select From List By Index  ${Select_Type}  1
    Select From List By Index  ${Select_Division}  1
    Choose File  ${Input_Attachment}  ${CURDIR}/test_big_image.jpg
    Compare Input Text  ${Input_Attachment}  C:\\fakepath\\test_big_image.jpg
    Mouse Over And Click  ${Label_Privacy_Policy}
    Mouse Over And Click  ${Button_Submit_Contact_Form}
    Compare Text  ${Help_Block}  Max file size 2Mb
    Check Styling  ${Help_Block}  color  rgba(169, 68, 66, 1)

Post-conditions
    Perform Post Conditions  2