import     openai
*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
#Library    Selenium2Library
Library    JSONLibrary
Library    json
Variables   ../Variables/Data/Variables.json
Variables   ../Variables/Locators/Locators.py
Resource   ../Resources/Loginkeyword.robot



*** Variables ***
#    ${variables}    Load JSON From File    C:\Users\Public\Variables\Data\Variables.json
#    set global variable   ${variables}

${Browser}   chrome
${URL}  https://www.saucedemo.com
${UsernameText}     standard_user
${PasswordText}     secret_sauce

${UsernameText}     standard_user1
${PasswordText}     secret_sauce11

${SearchBar}    name=q
${LoginButton}  xpath:(//input[@id='login-button'])[1]
${KeyName}   ENTER
#${Username}     id:user-name
#${Password}     id:password
${Header}   xpath://div[@class='login_logo']
${Text}     Swag Labs
${Products_Heading}     //*[@id="header_container"]/div[2]/span
${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe
${Add_to_cart_btn}    //button[@id='add-to-cart-sauce-labs-backpack']
${Cart}      //*[@id="shopping_cart_container"]/a
${checkout_btn}    //button[@id='checkout']
${name}   //input[@id='first-name']
${lastname}    //input[@id='last-name']
${postalcode}    //input[@id='postal-code']
${Continue_btn}    //*[@id="continue"]
${Finish_btn}     //button[@id='finish']
${checkout_complete}    //*[@id="header_container"]/div[2]/span
${checkout_text}    Thank you for your order!
${thanks}    //h2[contains(text(),'Thank you for your order!')]
#../Variables/Data/Variables.json
#openai.api_key   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

*** Test Cases ***
TC1: Open Browser and Redirect to the Website
    Open Browser    ${URL}   ${Browser}  executable_path=${chrome_driver_path}
    sleep  2s
    element should contain   ${Header}   ${Text}
    Maximize Browser Window
TC2: Verify Successful Login and Navigation to Home Screen
    Login Credentials
    sleep  1s
    click element   ${LoginButton}
    sleep  2s
    Log To Console    The user is logged in successfuly.
    Ensure that the Home Screen is visible
    sleep  1s
    log to console   The Home screen of Sauce Labs has been opened successfully
TC3: Check the Add to cart option availability
    Element Should Be Visible    ${Add_to_cart_btn}
    ${Add_to_cart_button_status}=    Run Keyword And Return Status    Page Should Contain Button     ${Add_to_cart_btn}
    Run Keyword If    '${Add_to_cart_button_status}' == 'True'   Log To Console    The Product is available to Purchase
    ...  ELSE   Log To Console  The Product isn't available.
    Sleep    1s
TC4: Show the Name and Price of the Product
    ${Name_Product}=  Get Text    //*[@id="item_4_title_link"]/div
    Log To Console   The Name of the Product is ${Name_Product}
    ${Price}=  Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Log To Console   The Price of the Product is ${Price}
    Sleep    1s
TC5: Add the item into the Cart
    Click Element    ${Add_to_cart_btn}
    Sleep    2s
TC6: Verify the item is added to the cart
    Click Element    ${Cart}
    Element Should Be Visible    //*[@id="item_4_title_link"]/div
    Log To Console    Product is sucesfully added to the cart
TC7: Checkout 
    Click Element    ${checkout_btn}
    Input Text    ${name}    inaam
    Input Text    ${lastname}    Ullah
    Input Text    ${postalcode}    54000
    Click Element    ${Continue_btn}
    Click Button    ${Finish_btn}   
TC8: Verify Checkout completed?
    ${checkout_status}=    Run Keyword And Return Status   Page Should Contain    ${checkout_text}
    Run Keyword If    '${checkout_status}' == 'True'   Log To Console    The Product is Sucessfully Purchased
    ...  ELSE   Log To Console  There is an error!!.
TC9: Share the Status with the User
    ${Status_text}=  Get Text    ${thanks}
    Log To Console    ${Status_text}
    Sleep    3s
    Close Browser
#    ${checkout_complete}


#    Element Should Be Visible    ${Error}
#    ${variables}    Load JSON From File    C:/Users/Public/Variables/Data/Variables.json
#    Log    ${variables['Browser']}
#    Open Browser  ${variables['URL']}   ${variables['Browser']}
#    sleep  2s
#    element should contain    ${Header}    ${variables['Text']}
#    log to console    The login screen of Sauce Labs has been opened successfully
#    sleep  2s
##    Correct Login Credentials         //Resource file is used
##    log to console   Logged IN
#    Incorrect Login Credentials
#    click element   ${LoginButton}
#    sleep  2s
#    sleep  2s









*** Keywords ***
Login Credentials
    input text   ${username}    ${usernametext}
    input text   ${password}    ${passwordtext}
Ensure that the Home Screen is visible
    element should contain      ${Products_Heading}    Products







