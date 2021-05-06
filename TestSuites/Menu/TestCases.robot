*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Menu.robot

Suite Setup  Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}
Suite Teardown  Perform Post Conditions  2
Test Teardown  Capture Page Screenshot  Screenshots/${TEST_NAME}.png

*** Test Cases ***
TC_M001
    Wait Until Element Is Visible  ${Menu_Search_Box_Submit}
    Mouse Over And Click  ${Magnifier_Icon}
    Wait Until Element Is Visible  ${Cross_Icon}
    Element Should Be Visible  ${Cross_Icon}
    Element Attribute Value Should Be  ${Search_Box_Input}  placeholder  I'm looking for

TC_M002
    Mouse Over And Click  ${Cross_Icon}
    Wait Until Element Is Visible  ${Magnifier_Icon}
    Element Should Not Be Visible  ${Cross_Icon}

TC_M003
    Mouse Over And Click  ${Magnifier_Icon}
    Input Text  ${Search_Box_Input}  glo
    Wait Until Element Is Visible  ${Autocomplete_Dropdown}
    Element Should Be Visible  ${Autocomplete_Item}
    Clear Element Text  ${Search_Box_Input}
    Mouse Over And Click  ${Cross_Icon}

TC_M004
    Mouse Over And Click  ${Magnifier_Icon}
    Input Text  ${Search_Box_Input}  olg
    Sleep  2
    Element Should Not Be Visible  ${Autocomplete_Dropdown}
    Element Should Not Be Visible  ${Autocomplete_Item}
    Clear Element Text  ${Search_Box_Input}
    Mouse Over And Click  ${Cross_Icon}

TC_M005
    Element Should Be Visible  ${Bike_Menu_Option}
    Mouse Over  ${Bike_Menu_Option}
    Wait Until Element Is Visible  ${Bike_Sub_Menu_Bikes_Link}
    Element Should Be Visible  ${Bike_Sub_Menu_Bikes_Link}
    Mouse Over  ${Img_Scott_Logo}
    Sleep  1
    Element Should Not Be Visible  ${Bike_Sub_Menu_Bikes_Link}
