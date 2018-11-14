*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${LOGIN URL}  https://www.imdb.com/search/name?gender=male,female&ref_=nv_tp_cel_1
${DELAY}  1


*** Keywords ***
Open Browser To IMDB/Search Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be  IMDb: Males/Females (Sorted by Popularity Ascending) - IMDb

