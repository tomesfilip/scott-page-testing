*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Cookies.robot
Resource  ../../Variables/TrailBikesProducts.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Trail_Bikes_Products}  ${Img_Scott_Logo}

*** Test Cases ***

TC_TBP001 - Filer By Model
    Mouse Over And Click  ${Button_Close_Cookies_Modal}
    Compare Text  ${Headline_Trail_Bikes}  TRAIL BIKES
    Element Should Be Visible  ${Button_Model_Filter}
    Element Should Be Visible  ${Button_Gender_Filter}
    Element Should Be Visible  ${Button_Best_For_Filter}
    Element Should Be Visible  ${Button_Women_Filter}
    Compare Text  ${Button_More_Filters}  More filters
    Mouse Over And Click  ${Button_Model_Filter}
    ${model_options_count}=  Get Element Count  ${Links_Model_Options}
    Should Be True  ${model_options_count}==4
    Mouse Over And Click  ${Link_Model_Option_Contessa}
    ${procuts_count}=  Get Element Count  ${Headlines_Product_Label}
    Should Be True  ${procuts_count}==2
    Compare Text  ${Headline_First_Product_Label}  SCOTT CONTESSA GENIUS 910 BIKE
    Compare Text  ${Headline_Second_Product_Label}  SCOTT CONTESSA GENIUS 920 BIKE
    Mouse Over And Click  ${Link_Clear_All_Filters}

#TC_TBP002 - Multiple Filters
#    Mouse Over And Click  ${Button_More_Filters}
#    Choose An Option From Dropdown  ${Button_Model_Filter}  ${Link_Model_Spark}
#    Compare Text  ${}  Spark
#    Choose An Option From Dropdown  ${Button_Gender_Filter}  ${Link_Gender_Unisex}
#    Compare Text  ${}  Unisex
#    Choose An Option From Dropdown  ${Button_Drivetrain_Filter}  ${Link_Drivetrain_Sram}
#    Compare Text ${}  SRAM
#    Choose An Option From Dropdown  ${Button_Frame_Filter}  ${Link_Frame_Alluminium}
#    Compare Text  ${}  Alluminium
#    Should Be Equal  ${products_count}  ${visible_products_count}
#    Mouse Over And Click  ${Link_Clear_All_Filters}
#
#TC_TBP003 - Products Per Page
#    Compare Text  ${}  23
#    Mouse Over And Click  ${}
#    ${products_per_page_options_count}=  Get Element Count  ${}
#    Mouse Over And Click  ${}
#    Should Be Equal  ${}  4
#    Element Should Be Visible  ${}
#    Compare Text  ${}  6
#    Mouse Over And Click  ${Link_Clear_All_Filters}

TC_TBP004 - Products Quickview
    ${first_product_name}=  Get Text  ${Headline_First_Product_Label}
    Mouse Over  ${First_Product}
    Sleep  6
    Mouse Over And Click  ${Link_Quickview}
    Wait Until Element Is Visible  ${Modal_Quickview}
    ${first_product_name_quickview}=  Get Text  ${Headline_Modal_Quickview}
    Should Be Equal As Strings  ${first_product_name}  ${first_product_name_quickview}
    Compare Text  ${Features_Headline_Modal_Quickview}  KEY FEATURES
    Element Should Be Visible  ${Img_Modal_Quickview}
    ${frame_sizes_count}=  Get Element Count  ${Buttons_Size_Modal}
    Should Be True  ${frame_sizes_count}==4
    Compare Text  ${Button_Size_S}  S
    Compare Text  ${Button_Size_M}  M
    Compare Text  ${Button_Size_L}  L
    Compare Text  ${Button_Size_XL}  XL


TC_TBP005 - Products Compare Add


Post-conditions
    Perform Post Conditions  2