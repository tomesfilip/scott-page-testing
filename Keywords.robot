*** Keywords ***

Set Pre Conditions
    [Arguments]  ${Speed}  ${Browser}  ${URL}  ${Element}
    Set Selenium Speed  0.2
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible  ${Element}

Click Link And Check URL
    [Arguments]  ${Link}  ${URLToCheck}
    Element Should Be Visible  ${Link}
    Set Focus To Element  ${Link}
    Mouse Over  ${Link}
    Click Element  ${Link}
    Wait Until Location Is  ${URLToCheck}
    Log Location

Click Blank Link And Check URL
    [Arguments]  ${Link}  ${URLToCheck}
    Element Should Be Visible  ${Link}
    Set Focus To Element  ${Link}
    Mouse Over  ${Link}
    Click Element  ${Link}
    Switch Window  new
    Wait Until Location Is  ${URLToCheck}
    Log Location

Click And Check No Visible
    [Arguments]  ${Button}  ${ElementToCheck}
    Element Should Be Visible  ${Button}
    Set Focus To Element  ${Button}
    Mouse Over  ${Button}
    Click Element  ${Button}
    Wait Until Element Is Not Visible  ${ElementToCheck}

Compare Text
    [Arguments]  ${Element}  ${ExpectedElementText}
    ${Element_Text}  Get Text  ${Element}
    Should Be Equal As Strings  ${Element_Text}  ${ExpectedElementText}

Perform Post Conditions
    [Arguments]  ${SleepValue}
    Sleep  ${SleepValue}
    Close Browser
