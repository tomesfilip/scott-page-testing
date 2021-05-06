*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/DealerLocator.robot
Resource  ../../ExpectedResults/DealerLocator.robot

Suite Setup  Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Dealer_Locator}  ${Img_Scott_Logo}
Suite Teardown  Perform Post Conditions  2
Test Teardown  Capture Page Screenshot  Screenshots/${TEST_NAME}.png

*** Test Cases ***
TC_DL002 - Dealer Locator Select Category
    Compare Text  ${Headline_Category_Running}  RUNNING
    Mouse Over And Click  ${Headline_Category_Running}
    Wait Until Element Is Visible  ${Button_Form_Submit}
    Compare Text  ${Button_Form_Submit}  FIND DEALERS
    Element Should Be Visible  ${Link_Show_Location}
    Element Should Be Visible  ${Input_Define_Location}
    Element Should Be Visible  ${Select_Radius}
    Element Should Be Visible  ${Option_Km}
    Element Should Be Visible  ${Option_Mi}

TC_DL003 - Dealer Locator Location Form
    Element Should Be Disabled  ${Button_Form_Submit}
    Type Text To Input  ${Input_Define_Location}  Zlín
    Wait Until Element Is Visible  ${List_Suggestions}
    ${count}=  Get Element Count  ${List_Suggestions_Items}
    ${expected_count}=  Convert To Integer  3
    Should Be Equal  ${count}  ${expected_count}
    Mouse Over And Click  ${List_Active_Item}
    Element Should Be Enabled  ${Button_Form_Submit}
    ${Input_Location_Value}=  Get Value  ${Input_Define_Location}
    Should Be Equal  ${Input_Location_Value}  Zlín, Zlín, Czech Republic
    Select From List By Value  ${Select_Radius}  100
    Mouse Over And Click  ${Option_Mi}
    ${Select_Radius_Value}=  Get Value  ${Select_Radius}
    Should Be Equal  ${Select_Radius_Value}  100
    Mouse Over  ${Button_Form_Submit}
    Execute Javascript  document.getElementById("submitButton").click()
    Wait Until Element Is Visible  ${Canvas_Map}