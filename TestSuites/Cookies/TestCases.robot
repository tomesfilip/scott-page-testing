*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Capture Page Screenshot On Failure
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Cookies.robot
Resource  ../../Variables/PrivacyPolicy.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}

*** Test Cases ***
TC_C001 - Test Accept Cookies
    Wait Until Element Is Visible  ${Cookies_Modal}
    Element Should Be Visible  ${Button_Close_Cookies_Modal}
    Click And Check No Visible  ${Button_Close_Cookies_Modal}  ${Cookies_Modal}
    Capture Page Screenshot  Screenshots/${TEST_NAME}.png
    Perform Post Conditions  1

TC_C002 - Test More Info Cookies
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}
    Wait Until Element Is Visible  ${Cookies_Modal}
    Element Should Be Visible  ${Link_Cookies_More_Info}
    Click Link And Check URL  ${Link_Cookies_More_Info}  ${URL_Scott_Policy}
    Wait Until Element Is Visible  ${Headline_Privacy_Policy}
    Compare Text  ${Headline_Privacy_Policy}  PRIVACY POLICY
    Capture Page Screenshot  Screenshots/${TEST_NAME}.png

Post-conditions
    Perform Post Conditions  2