*** Settings ***
Library  SeleniumLibrary
Library   SeleniumLibrary
Library   BuiltIn
Library    XML
Resource   ../Resources/Openbrowser.robot

*** Variables ***
${Browser}   chrome
${URL}  https://www.launchgood.com/
${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe


*** Keywords ***
#search for the login button
#Input Text ${Username} ${UsernameText}
#Input Text ${Password} ${PasswordText}
#Press Keys ${LoginButton} ${KeyName}
Open Broswer Chrome
        Open Browser    ${URL}   ${Browser}  executable_path=${chrome_driver_path}
Launchggod Home Page Should Be Open
    Title Should Be    Crowdfunding Incredible Muslims | LaunchGood
*** Test Cases ***
TC1: Open Broswer
    Open Broswer Chrome
TC2: Open the LaunchGood website
    Launchggod Home Page Should Be Open
TC3: Open Signup Page and complete Signup
    Click Element   ${ThreeDotsMenu}
    Click Element    ${SignUpButton}
    Click Element    ${FirstNameInput}
#    sleep  2s
#    Login Credentials
    Close Browser




*** Keywords ***
#Login Credentials
#    element should contain   ${Header}   ${Text}
#    input text   ${username}    ${usernametext}
#    input text   ${password}    ${passwordtext}
#    sleep  3s
#    press keys   ${loginbutton}    ${keyname}
#    sleep  5s


