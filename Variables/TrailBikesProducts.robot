*** Variables ***

${Headline_Trail_Bikes}  //h1
${Filter_Buttons}  //div[@id="filters-bar"]//button[@type="button"]
${Button_More_Filters}  //div[@id="filters-bar"]//button[contains(text(), "More filters")]
${Button_Model_Filter}  //div[@id="filters-bar"]//button[contains(text(), "model")]
${Button_Gender_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Gender")]
${Button_Best_For_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Best for")]
${Button_Women_Filter}  //div[@id="filters-bar"]//button[contains(text(), "Womens Specific")]
${Links_Model_Options}  //div[@id="filters-bar"]/div[@class="btn-group open"]/div/a
${Link_Model_Option_Contessa}  //a[@data-englishvalue="Contessa Genius"]
${Headlines_Product_Label}  //a[@id="product-label-url"]/h5
${Headline_First_Product_Label}  //div[@class="article"][1]//a[@id="product-label-url"]/h5
${Headline_Second_Product_Label}  //div[@class="article"][2]//a[@id="product-label-url"]/h5
${Link_Clear_All_Filters}  //a[@id="clear-filters"]
${First_Product}  //div[@class="article"][1]
${Link_Quickview}  //div[@class="article open active"]//a[contains(text(), "Quickview")]
${Modal_Quickview}  //div[@id="quickview-main"]
${Headline_Modal_Quickview}  //div[@id="quickview-main"]//h1
${Features_Headline_Modal_Quickview}  //div[@id="quickview-main"]//h4
${Img_Modal_Quickview}  //div[@id="quickview-main"]//figure/img
${Buttons_Size_Modal}  //div[@id="quickview-main"]//a/btn[contains(@class, "sizes--btn")]
${Button_Size_S}  //div[@id="quickview-main"]//a[1]/btn[contains(@class, "sizes--btn")]
${Button_Size_M}  //div[@id="quickview-main"]//a[2]/btn[contains(@class, "sizes--btn")]
${Button_Size_L}  //div[@id="quickview-main"]//a[3]/btn[contains(@class, "sizes--btn")]
${Button_Size_XL}  //div[@id="quickview-main"]//a[4]/btn[contains(@class, "sizes--btn")]
