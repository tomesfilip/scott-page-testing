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
    Element Should Be Visible  ${Element}
    ${Element_Text}=  Get Text  ${Element}
    Should Be Equal As Strings  ${Element_Text}  ${ExpectedElementText}

Compare Input Text
    [Arguments]  ${InputElement}  ${ExpectedText}
    Element Should Be Visible  ${InputElement}
    ${InputElementText}=  Get Value  ${InputElement}
    Should Be Equal As Strings  ${InputElementText}  ${ExpectedText}

Select Value From List And Verify
    [Arguments]  ${List}  ${Value}
    Select From List By Value  ${List}  ${Value}
    List Selection Should Be  ${List}  ${Value}

Type Text To Input
    [Arguments]  ${InputBox}  ${Text}
    Element Should Be Visible  ${InputBox}
    Mouse Over And Click  ${InputBox}
    Input Text  ${InputBox}  ${Text}

Get CSS Property Value
    [Arguments]  ${Element}  ${AttrName}
    ${css}=  Get WebElement  ${Element}
    ${prop_val}=  Call Method  ${css}  value_of_css_property  ${AttrName}
    [Return]  ${prop_val}

Check Hover Styling
    [Arguments]  ${Element}  ${ElementToMove}  ${AttrName}  ${ExpectedStyleValue}
    Element Should Be Visible  ${Element}
    Mouse Over  ${Element}
    ${style}=  Get CSS Property Value  ${Element}  ${AttrName}
    Sleep  1
    Should Be Equal  ${style}  ${ExpectedStyleValue}
    Mouse Over  ${ElementToMove}
    Sleep  1
    ${style}=  Get CSS Property Value  ${Element}  ${AttrName}
    Should Not Be Equal  ${style}  ${ExpectedStyleValue}


Perform Post Conditions
    [Arguments]  ${SleepValue}
    Sleep  ${SleepValue}
    Close Browser
