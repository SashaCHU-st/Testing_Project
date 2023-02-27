*** Settings ***
Library   SeleniumLibrary
Library   String 
Library   OperatingSystem
Library   String
Library   Collections

*** Variables ***
${url}   https://www.verkkokauppa.com/
${keyword}   PS5
${amount}   10
${input}  switch
${buttonLayout}  xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div[1]/ol
${path}  C:/Users/public/
${productpage}  https://www.verkkokauppa.com/fi/etusivu

*** Test Cases ***
Test search feature from main page with keyword PS5 and takes a screenshot of the first product
    #Open webpage and maximize
    Open browser   ${url}
    Maximize browser window
    Sleep   1s
    
    #Click on search bar
    Click element   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/input
    Sleep   2s
    
    #Input keyword PS5 and search
    Input Text    css:input[placeholder="Kirjoita hakusana"]    ${keyword}
    Sleep   3s
    Click button   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/div/button[2]
    Sleep   3s
    
    #Allow cookies and close the search window
    Wait until element is visible   xpath://*[@id="allow-cookies"]
    Click element   xpath://*[@id="allow-cookies"]
    Sleep   3s
    
    #Check if keyword is visible on the page
    Run keyword and return status    Page should contain   PS5
    Sleep   1s
    
    #Take screenshot
    Capture element screenshot   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div[1]/ol/li[1]/article
    


*** Test Cases ***
Test search feature with keyword PS5 and drill down the product page
    
    #Scroll down the page
    Execute JavaScript    window.scrollTo(0,100000)
    Sleep   1s
    
    #Check if xpath:/<footer> is visible
    Run keyword   Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/footer
    
    #Take a screenshot and close window
    Capture page screenshot
    
*** Test Cases ***
Test search feature with keyword PS5 and looks for a word PS5   
    #Check if keyword is visible in the article 
    #Wait until element is visible   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div[1]/ol/li[1]/article
    Run keyword   Page should contain   ${keyword}
    Sleep   10s
    
    #Click that article
    Click element   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div[1]/ol/li[1]/article/a
    Sleep   5s
    
    #Check if keyword is visible on the page
    Run keyword   Page should contain   ${keyword}
    
   
*** Test Cases ***
Test search feature with keyword PS5 and drill down the product page and check social media buttons
    #Open webpage and maximize
    #Open browser   ${url}   
    #Maximize browser window
    #Sleep   1s
    
    ${handles}=  Get Window Handles
    #Click on search bar
    Click element   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/input
    Sleep   2s
    
    #Input keyword PS5 and search
    Input Text    css:input[placeholder="Kirjoita hakusana"]    ${keyword}
    Sleep   1s
    Click button   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/div/button[2]
    Sleep   3s
    
    #Allow cookies and close the search window
    #Wait until element is visible   xpath://*[@id="allow-cookies"]
    #Sleep   1s
    #Click element   xpath://*[@id="allow-cookies"]
    #Sleep   3s
    
    #Wait and click on the product
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div[1]/ol/li[1]/article
    Click element   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div[1]/ol/li[1]/article
    Sleep   3s

*** Test Cases ***
Open website verkkokauppa.com and check Does all product categories have an icon (Tuotealueet) 
    #check if it containts logo of verkkokauppa
    Element should be visible   css:.VkLogo-sc-1l5lj7b-0 > path:nth-child(1)

    
    #check Does all product categories have an icon (Tuotealueet) 
    Click element   xpath:/html/body/div[1]/div[1]/header/div/label/span
    
    #calculate Tuotealueet elements
    ${count}=   get element count   xpath:/html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[*]/a/span[2]
    
    #check if every Tuotealueet elements has icon
    FOR   ${index}   IN RANGE   ${count}
        Should not be empty   /html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[*]/a/span[${index}]/svg
    END
    
    #return to main page for next text case
    Click element   xpath:/html/body/div[1]/div[1]   
    
*** Test Cases ***   
Checking hintapuntori
    Click element   xpath:/html/body/div[1]/div[1]/header/div/label/span
    Click element   xpath:/html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[1]/span
    
    sleep   3s
    Click element   xpath:/html/body/div[1]/div[1]/div/aside/nav/div[2]/div[2]/ul/li[1]/span
    sleep   4s
    Click element   xpath:/html/body/div[1]/div[1]/div/aside/nav/div[3]/div[2]/ul/li[1]/a/span[2]
    Page should contain   Airplay
    sleep   4s
    
    

    #checking first product
    Click element   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/ol/li[1]/article/a
    Run Keyword And Continue On Failure   page should contain   Hintapuntari
    
    sleep   3s
    #go back to list
    Go back
    #Click element   xpath:/html/body/div[1]/div[1]/div/div/div/a[5]
    sleep   4s
    
    #checking second product
    Click element   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/ol/li[2]/article/a
    Run Keyword And Continue On Failure   page should contain   Hintapuntari
    
    sleep   2s
    #go back to list
    Go back
    #Click element   xpath:/html/body/div[1]/div[1]/div/div/div/a[5]
    
    sleep   2s
    #checking third product
    Click element   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/ol/li[3]/article/a
    Run Keyword And Continue On Failure   Page should contain   Hintapuntari
    
    #go to main page
    Click element   xpath:/html/body/div[1]/div[1]/div/div/div/a[1]
    
*** Test Cases ***   
Checking ostoskori
    #go amin page
    Click element   xpath:/html/body/div[1]/div[1]/header/div/label/span
    sleep   5s
    #Close window
    sleep   4s
    #add first product to osotoskori
    Click button   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/div/ol/li[1]/div/div/button
    sleep   1s
     #add second product to osotoskori
    click button   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/div/ol/li[2]/div/div/button
    sleep   2s
    #go to ostoskori page
    Click element   xpath:/html/body/div[1]/div[1]/header/div[2]/div[3]/div/div[3]/div/div[2]/a

    sleep   2s
     #adjust number of items in ostoskori (adding 2 items)
    click button   xpath:/html/body/div[1]/div[1]/div/div/main/div[2]/section/div[1]/div/article/div/div[2]/div/div/div[2]/div/div/div[3]/button
    click button   xpath:/html/body/div[1]/div[1]/div/div/main/div[2]/section/div[1]/div/article/div/div[2]/div/div/div[2]/div/div/div[3]/button
    
    #checking input field, by first deleting current number and inserting user number (10)
    sleep   2 s
    Press keys   xpath://*[@id="quantity"]  CTRL+a   
    Press keys   xpath://*[@id="quantity"]   BACKSPACE

    input text   xpath://*[@id="quantity"]   ${amount}
    Textfield should contain   xpath://*[@id="quantity"]   ${amount}
    
    #deleting from ostoskori
    Click button   xpath:/html/body/div[1]/div[1]/div/div/main/div[2]/section/div[1]/div[2]/article/div/div[2]/div/div/div[2]/div/div/div[1]/button
    sleep   3s
    Page should contain   Tuote poistettu ostoskorista
    

   # Close browser
*** Test Cases ***
Open Verkkokauppa.com and search for product then check whether "Esittely" and "Lisätiedot" can be found
   #open google page and that cookie window comes
   #Open browser   https://www.verkkokauppa.com/
   #Get selenium timeout  
   #Maximize browser window
   click element   xpath:/html/body/div[1]/div[1]/header/div[1]/h1/a/svg[2]/path[1]
    sleep   5s
   #Wait until page contains   Evästeiden käytöstä
   #Click element   xpath://button[@id="allow-cookies"]
   # click the product
   Click element   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[*]/div/div/ol/li[*]/div/a
   # Check Esittely
   Sleep   10S
   Wait until page contains    kysymystä
   Sleep   10S
   Page should contain   Esittely
   Page should contain   Lisätiedot
*** Test Cases ***
Does all product categories have a "landing page"
   Click element   css:.sc-vze1el-0
   sleep   2s

   #Click element   class:category-list-item
   sleep   2s
   #calculate Tuotealueet elements
   ${count}=   Get element count   XPATH:/html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[*]/a/span[2]

    #check if every Tuotealueet elements has LANDING PAGE
    FOR   ${index}   IN RANGE   ${count-3}

         Get element count   /html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[${index}]/a/span[2]/svg
         Click element   xpath:/html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[${index}+1]/a/span[2]
         Sleep   2S
         Should not be empty   /html/body/div[1]/div[1]/div/div/main/header
         Click element   css:.sc-vze1el-0
         #Click image   xpath://button[@id='far-arrow-down']
         #Click Element At Coordinates    css:.sidebar-scroll-buttons--bottom > svg:nth-child(1)    ${195}    ${1515}

    END

    
*** Test Cases ***
Open website verkkokauppa.com and check if I can add products to 'Ostoskori'

    click element   xpath:/html/body/div[1]/div[1]/header/div[1]/h1/a/svg[2]/path[1]
    sleep   5s
    #Allow cookies and close the search window
    #Wait until element is visible   xpath://*[@id="allow-cookies"]
    #Click element   xpath://*[@id="allow-cookies"]
    #Sleep   1s
    
    #Choose 2 items into the Cart
    Click button   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/div/ol/li[1]/div/div/button
    sleep   1s
    click button   xpath:/html/body/div[1]/div[1]/div/div/main/div/div[2]/div/div/ol/li[2]/div/div/button
    sleep   1s
    
    #After addings the products, check if page contains 'Lisätty ostoskoriin'
    Page should contain   Lisätty ostoskoriin
    Click element   xpath:/html/body/div[1]/div[1]/header/div[2]/div[3]/div/div[3]/div/div[2]/a
    Sleep   2s
    
    #Open the Cart and check if page contains '2 tuotetta, yhteensä'
    Page should contain   2 tuotetta, yhteensä
    Capture page screenshot

    Close browser
    
*** Test Cases ***
Test search bar and layout functionality using keyword
  #Open webpage
   #Open Browser  ${url}
   #Maximize browser window
   #Page Should Contain  Verkkokauppa.com
   #Wait until page contains  Hyväksyn
    click element   xpath:/html/body/div[1]/div[1]/header/div[1]/h1/a/svg[2]/path[1]
    sleep   5s  
  # accept cookies to get it out of the way
   #Click element  id:allow-cookies
   #Page should contain  Verkkokauppa.com
   
  #locate and click search tab/button
   Click element   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/input
  #input keyword switch
  #error with test, will not search for the thing
   Input Text   css:input[placeholder="Kirjoita hakusana"]   ${input}
   Click element   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/input
   Click button   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/div/button[2]
   sleep  10s
  #Wait/confirm load
   Wait Until Page Contains  Hakutulokset haulle "switch"
   
*** Test Cases ***
Test image product page
 #open webpage
  #Open Browser  ${productpage}
  #Maximize browser window
  #Page Should Contain  Verkkokauppa.com
  #Wait until page contains  Hyväksyn
    click element   xpath:/html/body/div[1]/div[1]/header/div[1]/h1/a/svg[2]/path[1]
    sleep   5s
  #save screenshot to a place
  set screenshot directory  ${path}
  #take screenshot
  capture page screenshot  filename=selenium-screenshotproduct.png
 
*** Test Cases ***
Test image ps5 page
 #open web browser
  #open browser  ${productpage}
 #search keyword
  Input Text  css:input[placeholder="Kirjoita hakusana"]  ${keyword}
  Click button   xpath:/html/body/div[1]/div[1]/header/div/nav/form/div/div/button[2]
 #save screenshot
  set screenshot directory  ${path}
  #take screenshot
  capture page screenshot  filename=selenium-screenshotps5.png
  
***Test Cases***
Test comparison


   ${output}=  Run and return rc output   magick ${path}selenium-screenshotproduct.png   ${path}selenium-screenshotps5.png -metric RMSE -compare -format "%distortion" info:
   ${output}=  evaluate  ${output}[1]*100
  
   Log to console  ${output}
   Run keyword and continue on failure  Should be true ${output}<3
   Run keyword if  ${output}>=3 run magick ${path}selenium-screenshotproduct.png  ${path}selenium-screenshotps5.png -metric RMSE -compare ${path}difference.png











    #Scroll down the page
    Execute JavaScript    window.scrollTo(0,100000)
    Sleep   1s
    
    #Check if xpath:/<footer> is visible
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/footer
    
*** Test Cases ***
Check if Facebook link opens
    #Check if social media buttons work - Facebook
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[2]/a
    Click link   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[2]/a
    
*** Test Cases ***
Check if Instagram link opens   
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[3]/a
    Click link   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[3]/a
    
*** Test Cases ***
Check if Twitter link opens   
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[4]/a
    Click link   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[4]/a
    
*** Test Cases ***
Check if Youtube link opens   
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[5]/a
    Click link   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[5]/a
    
*** Test Cases ***
Check if LinkedIN link opens   
    Wait until element is visible   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[6]/a
    Click link   xpath:/html/body/div[1]/div[1]/aside/div[2]/div/div[2]/nav/div[2]/ul[2]/li[6]/a

*** Test Cases ***
Does all product categories have a "landing page"
    Open browser   ${URL}
   Click element   css:.sc-vze1el-0
   sleep   2s

   #Click element   class:category-list-item
   sleep   2s
   #calculate Tuotealueet elements
   ${count}=   Get element count   XPATH:/html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[*]/a/span[2]

    #check if every Tuotealueet elements has LANDING PAGE
    FOR   ${index}   IN RANGE   ${count}-4

         Get element count   /html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[${index}]/a/span[2]/svg
         Click element   xpath:/html/body/div[1]/div[1]/div/aside/nav/div/div[2]/ul/li[${index}+1]/a/span[2]
         Sleep   2S
         Should not be empty   /html/body/div[1]/div[1]/div/div/main/header
         Click element   css:.sc-vze1el-0
         #Click image   xpath://button[@id='far-arrow-down']
         #Click Element At Coordinates    css:.sidebar-scroll-buttons--bottom > svg:nth-child(1)    ${195}    ${1515}

    END