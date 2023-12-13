*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Variables  ../Variables/Locators/Locators.py


*** Variables ***
${chrome_driver_path}    C:/Program Files/Google/Chrome/chromedriver-win64/chromedriver-win64/chromedriver.exe
${Browser}   chrome
${URL}  https://www.launchgood.com/
*** Test Cases ***
Open Broswer Chrome
        Open Browser    ${URL}   ${Browser}  executable_path=${chrome_driver_path}