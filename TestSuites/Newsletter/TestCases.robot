*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  Dialogs
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Newsletter.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}

*** Test Cases ***

TC_N001 - Subscribe With Invalid Email
    Scroll Element Into View  ${Span_Sign_Up_Newsletter_Footer}
    Type Text To Input  ${Input_Email_Newsletter_Footer}  invalidmail@gmail.!
    Mouse Over And Click  ${Button_Submit_Newsletter_Footer}
    ${actual_url}=  Get Location
    Should Not Be Equal  ${actual_url}  ${URL_Scott_Newsletter}
    Clear Element Text  ${Input_Email_Newsletter_Footer}

TC_N002 - Subscribe Without Email
    Element Should Be Visible  ${Span_Sign_Up_Newsletter_Footer}
    Click Link And Check URL  ${Button_Submit_Newsletter_Footer}  ${URL_Scott_Newsletter}
    Compare Text  ${Headline_Newsletter}  NEWSLETTER
    Click Link And Check URL  ${Img_Scott_Logo}  ${URL_Scott_Main}

TC_N003 - Subscribe With Valid Email
    Scroll Element Into View  ${Span_Sign_Up_Newsletter_Footer}
    Type Text To Input  ${Input_Email_Newsletter_Footer}  validmail@gmail.com
    Click Link And Check URL  ${Button_Submit_Newsletter_Footer}  ${URL_Scott_Newsletter}
    Compare Text  ${Headline_Newsletter}  NEWSLETTER
    Compare Input Text  ${Input_Email_Newsletter}  validmail@gmail.com
    Clear Element Text  ${Input_Email_Newsletter}

TC_N004 - Newsletter Select Title
    Mouse Over And Click  ${Select_Title_Newsletter}
    ${title_options_count}=  Get Element Count  ${Options_Title_Newsletter}
    Should Be True  ${title_options_count} == 3
    Select Value From List And Verify  ${Select_Title_Newsletter}  other

TC_N005 - Newsletter Select Country Uniqueness
    Element Should Be Visible  ${Select_Country_Newsletter}
    Select Value From List And Verify  ${Select_Country_Newsletter}  sk
    @{country_options}=  Get List Items  ${Select_Country_Newsletter}
    # failing due to two abbrevations for Serbia
    List Should Not Contain Duplicates  ${country_options}

TC_N008 - Newsletter Submit Form With Invalid Mail
    Type Text To Input  ${Input_Email_Newsletter}  invalidmail@gmail.!
    Type Text To Input  ${Input_First_Name_Newsletter}  John
    Type Text To Input  ${Input_Last_Name_Newsletter}  Smith
    Mouse Over And Click  ${Label_Agreement_Accept}
    Wait Until Element Is Enabled  ${Button_Subscribe_Newsletter}
    Execute Manual Step  Please complete the CAPTCHA
    Mouse Over And Click  ${Button_Subscribe_Newsletter}
    Wait Until Element Is Visible  ${Error_Newsletter}
    Compare Text  ${Error_Newsletter}  Email is invalid
    Reload Page

TC_N009 - Submit Form Without reCAPTCHA Validation
    Wait Until Element Is Visible  ${Headline_Newsletter}
    Type Text To Input  ${Input_Email_Newsletter}  johnsmith@gmail.com
    Type Text To Input  ${Input_First_Name_Newsletter}  John
    Type Text To Input  ${Input_Last_Name_Newsletter}  Smith
    Mouse Over And Click  ${Label_Agreement_Accept}
    Wait Until Element Is Enabled  ${Button_Subscribe_Newsletter}
    Mouse Over And Click  ${Button_Subscribe_Newsletter}
    Wait Until Element Is Visible  ${Error_Newsletter}
    Compare Text  ${Error_Newsletter}  Captcha not verified

Post-conditions
    Perform Post Conditions  2