*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../../Keywords.robot
Resource  ../../URLs.robot
Resource  ../../Config/Browsers.robot
Resource  ../../Variables/MainPage.robot
Resource  ../../Variables/PDFManuals.robot

*** Test Cases ***
Pre-conditions
    Set Pre Conditions  0.2  ${ChromeBrowser}  ${URL_Scott_Manuals_Bike}  ${Img_Scott_Logo}

*** Test Cases ***

TC_PM001 - Bike Manuals Link
    Click Blank Link And Check URL  ${Link_Bike_Manuals}  https://celum.ssg-service.com/smartViews/view?view=scott-bike-b2c-manuals-bike
    @{titles}=  Get Window Titles
    ${second_title}=  Get From List  ${titles}  1
    Should Be Equal As Strings  ${second_title}  Bike Manuals | SCOTT Bike

TC_PM004 - Bike Manuals Category Options
    Select Frame  ${Frame_Bike_Manuals_SCOTT}
    Compare Text  ${Select_File_Category}  File Category
    ${pdf_count}=  Get Element Count  ${List_PDF_Items}
    Should Be True  ${pdf_count}>1
    Mouse Over And Click  ${Select_File_Category}
    Mouse Over And Click  ${Option_File_Category_Image}
    ${pdf_count}=  Get Element Count  ${List_PDF_Items}
    Should Be True  ${pdf_count}==0
    Compare Text  ${Text_Empty_Message}  NO MATCHING ASSETS.
    Compare Text  ${Filter_Bubble}  Images
    Element Should Be Visible  ${Icon_Cancel}
    Reload Page


TC_PM005 - Bike Manuals Category Options Search
    Select Frame  ${Frame_Bike_Manuals_SCOTT}
    Mouse Over And Click  ${Select_File_Category}
    ${file_category_count}=  Get Element Count  ${Options_File_Category}
    Should Be True  ${file_category_count}==5
    Type Text To Input  ${Input_File_Category}  D
    Sleep  1
    ${file_category_count}=  Get Element Count  ${Options_File_Category}
    Should Be True  ${file_category_count}==3
    Type Text To Input  ${Input_File_Category}  Do
    Sleep  1
    ${file_category_count}=  Get Element Count  ${Options_File_Category}
    Should Be True  ${file_category_count}==1
    Compare Text  ${Option_File_Category_First}  Documents
    Reload Page

TC_PM006 - Bike Manuals Menu
    Select Frame  ${Frame_Bike_Manuals_SCOTT}
    Compare Text  ${Link_2020_Scott_Bike_Manuals}  2020 Bike Manuals | SCOTT Bike
    Mouse Over And Click  ${Link_2020_Scott_Bike_Manuals}
    Compare Text  ${Link_Spark}  Spark
    Mouse Over And Click  ${Link_Spark}
    ${PDF_count}=  Get Element Count  ${List_PDF_Items}
    Should Be True  ${PDF_count}==6
    Compare Text  ${Text_PDF_Name}  spark_Manual_A5_2018_BIKE_SCOTT-Sports_EN.pdf

Post-conditions
    Perform Post Conditions  2