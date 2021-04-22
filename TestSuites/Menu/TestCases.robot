*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Menu.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}

*** Test Cases ***
TC_M001
    Wait Until Element Is Visible  ${MenuSearchBoxSubmit}
    Mouse Over And Click  ${MagnifierIcon}
    Wait Until Element Is Visible  ${CrossIcon}
    Element Should Be Visible  ${CrossIcon}
    Element Attribute Value Should Be  ${SearchBoxInput}  placeholder  I'm looking for

TC_M002
    Mouse Over And Click  ${CrossIcon}
    Wait Until Element Is Visible  ${MagnifierIcon}
    Element Should Not Be Visible  ${CrossIcon}

TC_M003
    Mouse Over And Click  ${MagnifierIcon}
    Input Text  ${SearchBoxInput}  glo
    Wait Until Element Is Visible  ${AutocompleteDropdown}
    Element Should Be Visible  ${AutocompleteItem}
    Clear Element Text  ${SearchBoxInput}
    Mouse Over And Click  ${CrossIcon}


TC_M004
    Mouse Over And Click  ${MagnifierIcon}
    Input Text  ${SearchBoxInput}  olg
    Sleep  2
    Element Should Not Be Visible  ${AutocompleteDropdown}
    Element Should Not Be Visible  ${AutocompleteItem}
    Clear Element Text  ${SearchBoxInput}
    Mouse Over And Click  ${CrossIcon}

TC_M005
    Element Should Be Visible  ${BikeMenuOption}
    Mouse Over  ${BikeMenuOption}
    Wait Until Element Is Visible  ${BikeSubMenuBikesLink}
    Element Should Be Visible  ${BikeSubMenuBikesLink}
    Mouse Over  ${Img_Scott_Logo}
    Sleep  1
    Element Should Not Be Visible  ${BikeSubMenuBikesLink}

Post-conditions
    Perform Post Conditions  2
