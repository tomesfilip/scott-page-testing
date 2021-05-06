*** Variables ***

${Frame_Bike_Manuals_SCOTT}  //iframe
${Link_Bike_Manuals}  //a[text()="Bike Manuals"]
${Form_Search_Box}  //form[@name="searchForm"]
${Sort_Box}  //div[@class="listsorting"]
${Select_Sort_By}  //div[@class="listsorting"]/span[@class="filterentry"][1]
${Select_Sort_Alphabet}  //div[@class="listsorting"]/span[@class="filterentry"][2]
${Option_Sort_By}  //div[@class="listsorting"]/span[@class="filterentry"][1]/div/a/span[@class="select2-chosen"]/span
${Select_File_Category}  //a/span[text()="File Category"]
${Option_File_Category_Image}  //span[text()="Images"]
${List_PDF_Items}  //ul[@class="assetList"]/li[@adapter="listAdapter"]
${Text_Empty_Message}  //div[@ng-if="isEmpty()"]
${Filter_Bubbles_Container}  //div[@class="filterBubbles"]
${Filter_Bubble}  //div[@class="filterBubbles"]/div
${Icon_Cancel}  //div[@class="filterBubbles"]/div/i[@class="celum-icon-cancel"]
${Input_File_Category}  //div[@class="filter-box"]/div/div/div/div/input
${Options_File_Category}  //ul[@id="ui-select-choices-3"]/li
${Option_File_Category_First}  //ul[@id="ui-select-choices-3"]/li[@id="ui-select-choices-row-3-0"]
${Link_Spark}  //span[text()="Spark"]
${Link_2020_Scott_Bike_Manuals}  //span[text()="2020 Bike Manuals | SCOTT Bike"]
${Text_PDF_Name}  //li[3]//div[@class="name ng-binding"]