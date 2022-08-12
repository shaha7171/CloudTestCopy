*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${logoutdots}    xpath://body//div[@id="root"]//div[@class="content"]//div//div//div//div[3]//button[1]//div[1]//*[local-name()="svg"]
${logoutbtn}    xpath://div[contains(text(),"Log out")]


*** Keywords ***

Logout from cloudvuemanager
    [Documentation]    Logging out from cloudvuemanager
    Click Element    ${logoutdots}
    Click Element    ${logoutbtn}
    #Author: Vishal Shaha