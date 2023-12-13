*** Settings ***
Library  SeleniumLibrary
Library   SeleniumLibrary
Library   BuiltIn
Library    XML
Resource   ../Resources/Openbrowser.robot
Variables   ../Variables/Locators/Locators.py
Resource   ../Resources/Loginkeyword.robot

*** Variables ***
${Browser}   chrome
${URL}  https://www.launchgood.com/
${UsernameText}     standard_user
${PasswordText}     secret_sauce
${SearchBar}    name=q
${LoginButton}  xpath:(//input[@id='login-button'])[1]
${KeyName}   ENTER
${Username}     id:user-name
${Password}     id:password
${Header}   xpath://div[@class='login_logo']
${Text}     Swag Labs
${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe

*** Test Cases ***
TC1: Open Broswer
    Open Broswer Chrome
TC2: Open the LaunchGood website
    Launchggod Home Page Should Be Open
TC3: Open Signup Page and complete Signup
    Maximize Browser Window
    Sleep    2s
    Click Element   ${ThreeDotsMenu}
    Click Element    ${SignUpButton}
    Sleep    1s
    Click Element    ${FirstNameInput}
    Clear Element    source
#    sleep  2s
#    Login Credentials
    Close Browser


*** Keywords ***



*** Keywords ***
search for the login button
Input Text ${Username} ${UsernameText}
Input Text ${Password} ${PasswordText}
Press Keys ${LoginButton} ${KeyName}
Open Broswer Chrome
        Open Browser    ${URL}   ${Browser}  executable_path=${chrome_driver_path}
Launchggod Home Page Should Be Open
    Title Should Be    Crowdfunding Incredible Muslims | LaunchGood