*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/MainSlider.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Main}  ${Main_Slider}

*** Test Cases ***
TC_MS001 - Slider Next Arrow
    Wait Until Element Is Visible  ${Main_Slider}
    Element Should Be Visible  ${Slider_Next_Arrow}
    ${curr_img_src}=  Get Element Attribute  ${Img_Slider_Active}  src
    ${dot_first}=  Get Element Attribute  ${Dot_Slider_First}  class
    ${dot_second}=  Get ELement Attribute  ${Dot_Slider_Second}  class
    Should Be Equal  ${dot_first}  owl-dot active
    Should Not Be Equal  ${dot_second}  owl-dot active
    Mouse Over And Click  ${Slider_Next_Arrow}
    Wait Until Element Is Visible  ${Headline_Active_Item}
    ${next_img_src}=  Get Element Attribute  ${Img_Slider_Active}  src
    ${dot_first}=  Get Element Attribute  ${Dot_Slider_First}  class
    ${dot_second}=  Get ELement Attribute  ${Dot_Slider_Second}  class
    Should Be Equal  ${dot_second}  owl-dot active
    Should Not Be Equal  ${dot_first}  owl-dot active
    Should Not Be Equal  ${curr_img_src}  ${next_img_src}
    Reload Page

# randomly failing to find ${Img_Slider_Active} element which was found in first TC
TC_MSOO2 - Slider Prev Arrow
    Wait Until Element Is Visible  ${Main_Slider}
    Element Should Be Visible  ${Slider_Prev_Arrow}
    ${curr_img_src}=  Get Element Attribute  ${Img_Slider_Active}  src
    ${dot_first}=  Get Element Attribute  ${Dot_Slider_First}  class
    ${dot_fourth}=  Get ELement Attribute  ${Dot_Slider_Fourth}  class
    Should Be Equal  ${dot_first}  owl-dot active
    Should Not Be Equal  ${dot_fourth}  owl-dot active
    Mouse Over And Click  ${Slider_Prev_Arrow}
    Wait Until Element Is Visible  ${Img_Slider_Active}
    ${next_img_src}=  Get Element Attribute  ${Img_Slider_Active}  src
    ${dot_first}=  Get Element Attribute  ${Dot_Slider_First}  class
    ${dot_fourth}=  Get ELement Attribute  ${Dot_Slider_Fourth}  class
    Should Be Equal  ${dot_fourth}  owl-dot active
    Should Not Be Equal  ${dot_first}  owl-dot active
    Should Not Be Equal  ${curr_img_src}  ${next_img_src}

# failing to find ${Headline_Active_Item}
TC_MS003 - Slider Dots
    Wait Until Element Is Visible  ${Main_Slider}
    ${active_item_headline}=  Get Text  ${Headline_Active_Item}
    ${dot_third}=  Get ELement Attribute  ${Dot_Slider_Third}  class
    Should Not Be Equal  ${dot_third}  owl-dot active
    Mouse Over And Click  ${Dot_Slider_Third}
    ${next_active_item_headline}=  Get Text  ${Headline_Active_Item}
    Should Not Be Equal  ${active_item_headline}  ${next_active_item_headline}
    ${dot_third}=  Get ELement Attribute  ${Dot_Slider_Third}  class
    Should Be Equal  ${dot_third}  owl-dot active


Post-conditions
    Perform Post Conditions  2