*** Settings ***
Library  SeleniumLibrary
Library   SeleniumLibrary
Library   BuiltIn

*** Variables ***
${Browser}   chrome
${URL}  https://www.launchgood.com/
${UsernameText}     standard_user
${PasswordText}     secret_sauce
${SearchBar}    name=q
${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe


*** Keywords ***
search for the login button
Input Text ${Username} ${UsernameText}
Input Text ${Password} ${PasswordText}
Press Keys ${LoginButton} ${KeyName}


*** Test Cases ***

Open Login Page
    Open Browser    ${URL}   ${Browser}    executable_path=${chrome_driver_path}
    sleep  2s
    Login Credentials
    Close Browser




*** Keywords ***
Login Credentials
    element should contain   ${Header}   ${Text}
    input text   ${username}    ${usernametext}
    input text   ${password}    ${passwordtext}
    sleep  3s
    press keys   ${loginbutton}    ${keyname}
    sleep  5s


