*** Settings ***
Resource  ../../Config/BaseSettings.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/Cookies.robot
Resource  ../../Variables/TrailBikesProducts.robot

Suite Setup  Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Trail_Bikes_Products}  ${Img_Scott_Logo}
Suite Teardown  Perform Post Conditions  2
Test Teardown  Capture Page Screenshot  Screenshots/${TEST_NAME}.png

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

TC_TBP002 - Multiple Filters
    Mouse Over And Click  ${Button_More_Filters}
    Choose An Option From Dropdown  ${Button_Model_Filter}  ${Link_Model_Option_Spark}
    Compare Text  ${Badge_Spark_Filter}  Spark
    Choose An Option From Dropdown  ${Button_Gender_Filter}  ${Link_Gender_Option_Unisex}
    Compare Text  ${Badge_Unisex_Filter}  Unisex
    Mouse Over And Click  ${Button_More_Filters}
    Choose An Option From Dropdown  ${Button_Drivetrain_Filter}  ${Link_Drivetrain_Option_SRAM}
    Compare Text  ${Badge_SRAM_Filter}  SRAM
    Mouse Over And Click  ${Button_More_Filters}
    Choose An Option From Dropdown  ${Button_Frame_Filter}  ${Link_Drivetrain_Option_Aluminium}
    Compare Text  ${Badge_Aluminium_Filter}  Aluminium
    ${visible_products_count}=  Get Element Count  ${Headlines_Product_Label}
    Compare Text  ${Total_Results}  ${visible_products_count} Products
    Mouse Over And Click  ${Link_Clear_All_Filters}

TC_TBP003 - Products Per Page
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    Compare Text  ${Total_Results}  23 Products
    Mouse Over And Click  ${Button_Products_Per_Page}
    ${products_per_page_options_count}=  Get Element Count  ${Links_Products_Per_Page}
    Compare Text  ${products_per_page_options_count}  5
    Mouse Over And Click  ${Link_Four_Products_Per_Page}
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    ${visible_products_count}=  Get Element Count  ${Headlines_Product_Label}
    Compare Text  ${visible_products_count}  4
    Compare Text  ${Current_Page}  1
    Compare Text  ${Total_Pages}  6
    Mouse Over And Click  ${Link_Clear_All_Filters}

TC_TBP004 - Products Quickview
    Wait Until Element Is Visible  ${Img_Scott_Logo}
    ${first_product_name}=  Get Text  ${Headline_First_Product_Label}
    Mouse Over  ${First_Product}
    Sleep  3
    Click Element  ${Link_Quickview}
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