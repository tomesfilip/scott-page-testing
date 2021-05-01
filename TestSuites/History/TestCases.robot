*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Cookies.robot
Resource  ../../Variables/History.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_History}  ${Img_Scott_Logo}

*** Test Cases ***

TC_Hi002 - Timeline Arrow
    Mouse Over And Click  ${Button_Close_Cookies_Modal}
    Scroll Element Into View  ${First_Timeline}
    Element Should Be Visible  ${Left_Arrow}
    Element Should Be Visible  ${Right_Arrow}
    Compare Text  ${First_Timeline_First_Year}  1970
    Compare Text  ${First_Timeline_Second_Year}  1971
    Mouse Over And Click  ${Right_Arrow}
    Element Should Not Be Visible  ${First_Timeline_First_Year}
    Element Should Not Be Visible  ${First_Timeline_Second_Year}
    Compare Text  ${First_Timeline_Third_Year}  1978

Post-conditions
    Perform Post Conditions  2