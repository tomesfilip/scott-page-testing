*** Variables ***

${Headline_Trail_Bikes}  //h1
${Headlines_Product_Label}  //a[@id="product-label-url"]/h5
${Headline_First_Product_Label}  //div[@class="article"][1]//a[@id="product-label-url"]/h5
${Headline_Second_Product_Label}  //div[@class="article"][2]//a[@id="product-label-url"]/h5
${Headline_Modal_Quickview}  //div[@id="quickview-main"]//h1
${Features_Headline_Modal_Quickview}  //div[@id="quickview-main"]//h4

${Button_Products_Per_Page}  //div[contains(@class, "sorting-bar-container")][1]//div[@class="nbrOfProductsPerPage"]//button
${Filter_Buttons}  //div[@id="filters-bar"]//button[@type="button"]
${Button_More_Filters}  //div[@id="filters-bar"]//button[contains(text(), "More filters")]
${Button_Model_Filter}  //div[@id="filters-bar"]//button[contains(text(), "model")]
${Button_Gender_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Gender")]
${Button_Best_For_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Best for")]
${Button_Women_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Womens Specific")]
${Button_Drivetrain_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Drivetrain")]
${Button_Frame_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Frame")]
${Buttons_Size_Modal}  //div[@id="quickview-main"]//a/btn[contains(@class, "sizes--btn")]
${Button_Size_S}  //div[@id="quickview-main"]//a[1]/btn[contains(@class, "sizes--btn")]
${Button_Size_M}  //div[@id="quickview-main"]//a[2]/btn[contains(@class, "sizes--btn")]
${Button_Size_L}  //div[@id="quickview-main"]//a[3]/btn[contains(@class, "sizes--btn")]
${Button_Size_XL}  //div[@id="quickview-main"]//a[4]/btn[contains(@class, "sizes--btn")]

${Links_Model_Options}  //div[@id="filters-bar"]/div[@class="btn-group open"]/div/a
${Links_Products_Per_Page}  //div[contains(@class, "sorting-bar-container")][1]//div[@id="nbrOfProductsPerPageDrop"]/a
${Link_Four_Products_Per_Page}  //div[@id="nbrOfProductsPerPageDrop"]/a[@value="4"]
${Link_Model_Option_Spark}  //a[@data-englishvalue="Spark"]
${Link_Model_Option_Contessa}  //a[@data-englishvalue="Contessa Genius"]
${Link_Gender_Option_Unisex}  //a[@data-englishvalue="Unisex"]
${Link_Drivetrain_Option_SRAM}  //a[@data-englishvalue="SRAM"]
${Link_Drivetrain_Option_Aluminium}  //a[@data-englishvalue="Aluminium"]
${Link_Clear_All_Filters}  //a[@id="clear-filters"]
${Link_Quickview}  //div[@class="article open active"]//a[contains(text(), "Quickview")]

${Badge_Applied_Filters}  //div[@id="your_selection"]/span[@class="label label-primary"]
${Badge_Spark_Filter}  //span[contains(text(), "Spark")]
${Badge_Unisex_Filter}  //span[contains(text(), "Unisex")]
${Badge_SRAM_Filter}  //span[contains(text(), "SRAM")]
${Badge_Aluminium_Filter}  //span[contains(text(), "Aluminium")]

${Total_Results}  //div[@class="totalResults"]
${Current_Page}  //span[@class="current"]
${Total_Pages}  //span[@class="total"]

${First_Product}  //div[@class="article"][1]
${Modal_Quickview}  //div[@id="quickview-main"]
${Img_Modal_Quickview}  //div[@id="quickview-main"]//figure/img


