*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    JSONLibrary
Variables  ../Variables/Locators/Locators.py
Resource   ../Resources/Loginkeyword.robot


*** Variables ***
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
${Products_Heading}    //*[@id="header_container"]/div[2]/span
${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe


*** Test Cases ***
TC1: Ensure Sauce Labs login screen appears
    Open Browser    ${URL}   ${Browser}  executable_path=${chrome_driver_path}
    sleep  2s
    element should contain   ${Header}   ${Text}
    log to console    The login screen of Sauce Labs has been opened successfully

TC2: Verify Successful Login and Navigation to Home Screen
    Login Credentials
    sleep  1s
    click element   ${LoginButton}
    sleep  3s
    Log To Console    The user is logged in successfuly. 
    Ensure that the Home Screen is visible
    sleep  3s
    log to console   The Home screen of Sauce Labs has been opened successfully
    Close Browser


*** Keywords ***
Login Credentials
    input text   ${username}    ${usernametext}
    input text   ${password}    ${passwordtext}
Ensure that the Home Screen is visible
    element should contain      ${Products_Heading}    Products






