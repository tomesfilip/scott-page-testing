*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Help.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Img_Scott_Logo}

*** Test Cases ***
TC_001 - Open Help Sub Page
    Wait Until Element Is Visible  ${Link_Help}
    Click Blank Link And Check URL  ${Link_Help}  ${URL_Scott_Help}
    Element Should Be Visible  ${Input_Search_Box}
    Compare Text  ${Headline_Help}  HOW CAN WE HELP YOU?

TC_OO2 - Test Whisperer Valid Phrase
    Mouse Over  ${Input_Search_Box}
    Click Element  ${Input_Search_Box}
    Input Text  ${Input_Search_Box}  how
    Wait Until Element Is Visible  ${AutoComplete}
    Element Should Be Visible  ${AutoCompleteOption}
    Clear Element Text  ${Input_Search_Box}

TC_003 - Test Whisperer Invalid Phrase
    Mouse Over  ${Input_Search_Box}
    Click Element  ${Input_Search_Box}
    Input Text  ${Input_Search_Box}  brm
    Sleep  2
    Element Should Not Be Visible  ${AutoComplete}
    Clear Element Text  ${Input_Search_Box}

TC_004 - Test Search Valid Results
    Mouse Over  ${Input_Search_Box}
    Click Element  ${Input_Search_Box}
    Input Text  ${Input_Search_Box}  what
    Press Keys  ${Input_Search_Box}  ENTER
    Wait Until Element Is Visible  ${SearchResutlsTitle}
    Compare Text  ${SearchResutlsTitle}  63 RESULTS FOR "WHAT"
    Compare Text  ${FirstResultTitle}  What is AeroFoam?
    Clear Element Text  ${Input_Search_Box}

TC_005 - Test Search Invalid Results
    Mouse Over  ${Input_Search_Box}
    Click Element  ${Input_Search_Box}
    Input Text  ${Input_Search_Box}  jkl
    Press Keys  ${Input_Search_Box}  ENTER
    Wait Until Element Is Visible  ${NoResultsParagraph}
    Compare Text  ${NoResultsParagraph}  We couldn't find any results for : "query"
    Clear Element Text  ${Input_Search_Box}

Post-conditions
    Perform Post Conditions  2