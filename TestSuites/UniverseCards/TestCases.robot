*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/UniverseCards.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}

*** Test Cases ***
TC_UC001 - Hovering Over Universe Card
    Wait Until Element Is Visible  ${Headline_Universe}
    Scroll Element Into View  ${Headline_Universe}
    Check Hover Styling  ${Img_Bike_Universe_Card}  ${Headline_Universe}  filter  brightness(0.5)

TC_UCOO2 - Functional Link Winter Card
    Click Link And Check URL  ${Link_Wintersports_Universe_Card}  ${URL_Scott_Wintersports}

Post-conditions
    Perform Post Conditions  2