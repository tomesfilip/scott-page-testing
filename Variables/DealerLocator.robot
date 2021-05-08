*** Variables ***

${Headline_Dealer_Locator}  //h1[@class="title h3"]
${Headline_Category_Bike}  //div[1]/h6
${Headline_Category_Wintersports}  //div[2]/h6
${Headline_Category_Running}  //div[3]/h6
${Headline_Category_Motorsports}  //div[4]/h6
${Card_Category_Active}  //div[contains(@class, "active-icon")]
${Button_Form_Submit}  //button[@id="submitButton"]
${Link_Show_Location}  //a[@ng-click="showlocation()"]
${Input_Define_Location}  //input[@aria-label="Define a location"]
${Select_Radius}  //select[@name="radius"]
${Option_Km}  //div[@class="location-form--dist-type"]/span[1]
${Option_Mi}  //div[@class="location-form--dist-type"]/span[2]
${List_Suggestions}  //ul[@class="suggestions"]
${List_Suggestions_Items}  //ul[@class="suggestions"]/li
${List_Active_Item}  //ul[@class="suggestions"]/li[@class=" active"]
${Frame_Form}  //iframe[@id="ssIFrame_google"]
${Canvas_Map}  //canvas
