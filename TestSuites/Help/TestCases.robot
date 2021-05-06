*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Help.robot

Suite Setup  Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}
Suite Teardown  Perform Post Conditions  2
Test Teardown  Capture Page Screenshot  Screenshots/${TEST_NAME}.png

*** Test Cases ***
TC_H001 - Open Help Sub Page
    Wait Until Element Is Visible  ${Link_Help}
    Click Blank Link And Check URL  ${Link_Help}  ${URL_Scott_Help}
    Element Should Be Visible  ${Input_Search_Box}
    Compare Text  ${Headline_Help}  HOW CAN WE HELP YOU?

TC_H002 - Test Whisperer Valid Phrase
    Type Text To Input  ${Input_Search_Box}  how
    Wait Until Element Is Visible  ${Auto_Complete}
    Element Should Be Visible  ${Auto_Complete_Option}
    Clear Element Text  ${Input_Search_Box}

TC_H003 - Test Whisperer Invalid Phrase
    Type Text To Input  ${Input_Search_Box}  brm
    Sleep  2
    Element Should Not Be Visible  ${Auto_Complete}
    Clear Element Text  ${Input_Search_Box}

TC_H004 - Test Search Valid Results
    Type Text To Input  ${Input_Search_Box}  what
    Press Keys  ${Input_Search_Box}  ENTER
    Wait Until Element Is Visible  ${Search_Resutls_Title}
    Compare Text  ${Search_Resutls_Title}  63 RESULTS FOR "WHAT"
    Compare Text  ${First_Result_Title}  What is AeroFoam?
    Clear Element Text  ${Input_Search_Box}

TC_H005 - Test Search Invalid Results
    Type Text To Input  ${Input_Search_Box}  jkl
    Press Keys  ${Input_Search_Box}  ENTER
    Wait Until Element Is Visible  ${No_Results_Paragraph}
    Compare Text  ${No_Results_Paragraph}  We couldn't find any results for : "query"
    Clear Element Text  ${Input_Search_Box}