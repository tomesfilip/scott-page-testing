*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Cookies.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Mountain_Bikes_Categories}  ${Img_Scott_Logo}

*** Test Cases ***

TC_MBC002 - Filer Menu
    Mouse Over And Click  ${Button_Close_Cookies_Modal}
    Mouse Over And Click  ${Menu_Item_Cross_Country}
    Mouse Over And Click  ${Menu_Item_}



Post-conditions
    Perform Post Conditions  2