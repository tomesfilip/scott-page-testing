*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Location.robot

Suite Setup  Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}
Suite Teardown  Perform Post Conditions  2
Test Teardown  Capture Page Screenshot  Screenshots/${TEST_NAME}.png

*** Test Cases ***
TC_L001 - Change Continent Tabs
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    Click Link And Check URL  ${Link_Selected_Country_Flag}  ${URL_Scott_Country}
    Wait Until Element Is Visible  ${Country_Headline}
    Compare Text  ${Country_Headline}  COUNTRY SELECTION
    Mouse Over And Click  ${Asia_Tab}
    Wait Until Element Is Visible  ${Section_Visible_Countries}
    ${count}=  Get Element Count  ${Links_Visible_Countries}
    Should Be True  ${count}==4
    Compare Text  ${Link_First_Visible_Contry}  China
    Reload Page

TC_L002 - Change Page Localization
    Wait Until Element Is Visible  ${Country_Headline}
    Compare Text  ${Selected_Tab}  EUROPE
    Click Link And Check URL  ${Link_Country_Czech}  ${URL_Scott_Czech}
