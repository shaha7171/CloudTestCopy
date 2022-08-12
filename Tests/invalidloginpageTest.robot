*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObjects/loginpage.robot
Resource    ../PageObjects/dashboardpage.robot
Resource    ../Libraries/commonutility.robot
Resource    ../Libraries/TestData.robot
Test Template    Invalid login test


*** Variables ***
${staffusername}             shahavp71@gmail.com
${staffpassword}             Jci@12345
${passwordresetemail}        vshahaqa@gmail.com


*** Test Cases ***    Invalidstaffusername    Invalidstaffpassword
Right user empty password    shahavp71@gmail.com    ${EMPTY}
Right user Invalid password    shahavp71@gamil.com    Test@1234
Wrong User right password    shahavp@gmail.com    Jci@12345
Wrong user empty password    shahavp@gmail.com    ${EMPTY}
Wrong user wrong password    jqla@gmail.com    Jci@123

    
*** Keywords ***
Invalid login test 
    [Arguments]       ${Invalidstaffusername}    ${Invalidstaffpassword}
    commonutility.Open Web Browser    ${cloudvuemanagerURL}    ${browser}
    loginPage.Input User Name    ${Invalidstaffusername}
    loginPage.Input password    ${Invalidstaffpassword}
    loginPage.Click on Login Button
    sleep    2
    loginpage.Verify Invalid error message    //span[normalize-space()="Login"]
    Close Browser
    #Author: Vishal Shaha


