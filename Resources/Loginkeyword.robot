*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library     json
Library     JSONLibrary
Variables  ../Variables/Locators/Locators.py

#//here import the data file

*** Keywords ***
Correct Login Credentials
    ${variables}   Load JSON From File  C:\Users\Muhammad Inaam\Downloads\Web_and_API\Variables\Data\Variables.json
    set global variable     ${variables}
    input text   ${username}    ${variables['CorrectUsernameText']}
    input text   ${password}    ${variables['CorrectPassword']}

Incorrect Login Credentials
    ${variables}    Load JSON From File    C:/Users/Public/Variables/Data/Variables.json
    input text   ${username}    ${variables['InCorrectPassword']}
    input text   ${password}    ${variables['InCorrectPassword']}

Login
    [Arguments]   ${uname}    ${pwd}
    input text   ${username}    ${uname}
    input text   ${password}    ${pwd}
