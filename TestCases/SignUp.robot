*** Settings ***
Library           Selenium2Library
Library           SeleniumLibrary

Library    XML
Library   BuiltIn
Library    XML
Library    AppiumLibrary
Resource   ../Resources/Openbrowser.robot
Variables   ../Variables/Locators/Locators.py
Variables   ../Variables/Data/Variables.robot
Resource   ../Resources/Loginkeyword.robot
Resource    ../Variables/Data/Variables.robot
Resource    ../login_tests/SignUp.robot

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

${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe
${Browser}   chrome
${URL}  https://www.launchgood.com/
${firstnameText}   inaam
${lastnameText}  Ullah
${Email}     inaam562@gmail.com
${Password}   123456
${user-name}   inaam
*** Test Cases ***
TC1: Open Broswer
    Open Broswer Chrome
TC2: Open the LaunchGood website
    Launchggod Home Page Should Be Open
TC3: Open Signup Page and complete Signup
    Maximize Browser Window
    Sleep    2s
    SeleniumLibrary.Click Element    ${ThreeDotsMenu}
    AppiumLibrary.Click Element   ${ThreeDotsMenu}
    AppiumLibrary.Click Element    ${SignUpButton}
    Sleep    1s
    AppiumLibrary.Click Element    ${FirstNameInput}
    Input Text      ${FirstNameInput}       ${firstnameText}

    Input Value     ${FirstNameInput}       ${firstnameText}

#    Clear Element    ${LastNameInput}
#    Input Text   ${LastNameInput} ${lastnameText}
#    Input Text   ${EmailInput}    ${Email}
#    sleep  2s
#    Login Credentials
    Close Browser



*** Keywords ***
search for the login button
Input Text  ${Username}   ${user-name}
Input Text ${Password} ${PasswordText}
Press Keys ${LoginButton} ${KeyName}
Open Broswer Chrome
        Open Browser    ${URL}   ${Browser}  executable_path=${chrome_driver_path}
Launchggod Home Page Should Be Open
    Title Should Be    Crowdfunding Incredible Muslims | LaunchGood
Input Username
    [Arguments]    ${username}
    Input Text      ${FirstNameInput}       ${firstnameText}
Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}