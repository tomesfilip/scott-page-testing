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
    Wait Until Element Is Visible  ${Element}
    ${Element_Text}=  Get Text  ${Element}
    Should Be Equal As Strings  ${Element_Text}  ${ExpectedElementText}

Compare Input Text
    [Arguments]  ${InputElement}  ${ExpectedText}
    Wait Until Element Is Visible  ${InputElement}
    ${InputElementText}=  Get Value  ${InputElement}
    Should Be Equal As Strings  ${InputElementText}  ${ExpectedText}

Select Value From List And Verify
    [Arguments]  ${List}  ${Value}
    Wait Until Element Is Visible  ${List}
    Select From List By Value  ${List}  ${Value}
    List Selection Should Be  ${List}  ${Value}

Type Text To Input
    [Arguments]  ${InputBox}  ${Text}
    Wait Until Element Is Visible  ${InputBox}
    Mouse Over And Click  ${InputBox}
    Input Text  ${InputBox}  ${Text}

Get CSS Property Value
    [Arguments]  ${Element}  ${AttrName}
    ${css}=  Get WebElement  ${Element}
    ${prop_val}=  Call Method  ${css}  value_of_css_property  ${AttrName}
    [Return]  ${prop_val}

Check Styling
    [Arguments]  ${Element}  ${AttrName}  ${ExpectedStyleValue}
    Wait Until Element Is Visible  ${Element}
    ${style}=  Get CSS Property Value  ${Element}  ${AttrName}
    Should Be Equal  ${style}  ${ExpectedStyleValue}

Check Hover Styling
    [Arguments]  ${Element}  ${ElementToMove}  ${AttrName}  ${ExpectedStyleValue}
    Wait Until Element Is Visible  ${Element}
    Mouse Over  ${Element}
    ${style}=  Get CSS Property Value  ${Element}  ${AttrName}
    Sleep  1
    Should Be Equal  ${style}  ${ExpectedStyleValue}
    Mouse Over  ${ElementToMove}
    Sleep  1
    ${style}=  Get CSS Property Value  ${Element}  ${AttrName}
    Should Not Be Equal  ${style}  ${ExpectedStyleValue}

Fill Contact Form Inputs
    [Arguments]  ${InputFName}  ${FName}  ${InputLName}  ${LName}  ${InputEmail}  ${Email}  ${TextareaMsg}  ${Msg}
    Type Text To Input  ${InputFName}  ${FName}
    Type Text To Input  ${InputLName}  ${LName}
    Type Text To Input  ${InputEmail}  ${Email}
    Type Text To Input  ${TextareaMsg}  ${Msg}

Select Options Contact Form Selects By Index
    [Arguments]  ${SelectGender}  ${SelectCountry}  ${SelectType}  ${SelectDivision}  ${Index}
    Select From List By Index  ${SelectGender}  ${Index}
    Select From List By Index  ${SelectCountry}  ${Index}
    Select From List By Index  ${SelectType}  ${Index}
    Select From List By Index  ${SelectDivision}  ${Index}

Perform Post Conditions
    [Arguments]  ${SleepValue}
    Sleep  ${SleepValue}
    Close Browser
