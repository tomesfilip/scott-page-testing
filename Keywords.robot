*** Keywords ***

Set Pre Conditions
    [Arguments]  ${Speed}  ${Browser}  ${URL}  ${Element}
    Set Selenium Speed  0.2
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible  ${Element}

Mouse Over And Click
    [Arguments]  ${Element}
    Element Should Be Visible  ${Element}
    Set Focus To Element  ${Element}
    Mouse Over  ${Element}
    Click Element  ${Element}

Click Link And Check URL
    [Arguments]  ${Link}  ${URLToCheck}
    Mouse Over And Click  ${Link}
    Wait Until Location Is  ${URLToCheck}
    Log Location

Click Blank Link And Check URL
    [Arguments]  ${Link}  ${URLToCheck}
    Mouse Over And Click  ${Link}
    Switch Window  new
    Wait Until Location Is  ${URLToCheck}
    Log Location

Click And Check No Visible
    [Arguments]  ${Button}  ${ElementToCheck}
    Mouse Over And Click  ${Button}
    Wait Until Element Is Not Visible  ${ElementToCheck}

Compare Text
    [Arguments]  ${Element}  ${ExpectedElementText}
    ${Element_Text}  Get Text  ${Element}
    Should Be Equal As Strings  ${Element_Text}  ${ExpectedElementText}

Perform Post Conditions
    [Arguments]  ${SleepValue}
    Sleep  ${SleepValue}
    Close Browser
