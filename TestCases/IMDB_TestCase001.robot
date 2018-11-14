*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/IMDB_Resource.robot

Suite Setup  Open Browser To IMDB/Search Page
Suite Teardown  Close Browser

*** Variables ***
${header}  Males/Females(Sorted by Name Ascending)
${response}  1-50 of 5,192,060 names.

*** Test Cases ***
IMDB_TestCase_001 Verify Page Title of IMDB/Search Page

    Title Should Be  IMDb: Males/Females (Sorted by Popularity Ascending) - IMDb
    Get Text  //h1[@class='header']
    Should Be Equal As Strings    ${header}    Males/Females(Sorted by Name Ascending)
    Get Text  //body[@id='styleguide-v2']/div[@id='wrapper']/div[@id='root']/div[@id='pagecontent']/div[@id='content-2-wide']/div[@id='main']/div[@class='article']/div[1]/span[1]
    Should Be Equal As Strings    ${response}    1-50 of 5,192,060 names.


*** Test Cases ***
IMDB_TestCase_002 Males/Females (Check Order Like(A-Z,Birth Date,Death Date and STARmeter) IMDB/Search Page
    Click Link  xpath://a[contains(text(),'A-Z')]
    Click Link  xpath://a[contains(text(),'Birth Date')]
    Click Link  xpath://a[contains(text(),'Death Date')]
    Click Link  xpath://a[contains(text(),'STARmeter')]

*** Test Cases ***
IMDB_TestCase_003 IMDB Application Sign In
    Click Link  xpath://a[@id='nblogin']
    Click Link  xpath://a[contains(@class,'list-group-item create-account')]
    IMDB Sign in  Testing  ImdbTesting@gmail.com  Test@123  Test@123


*** Keywords ***
IMDB Sign in
    [Arguments]  ${Yourname}  ${Email}  ${Password}  ${CheckPassword}
    Input Text  id:ap_customer_name ${Yourname}
    Input Text  id:ap_email  ${Email}
    Input Text  id:ap_password  ${Password}
    Input Text  id:ap_password_check  ${CheckPassword}
    Click Button  xpath://input[@id='continue']



