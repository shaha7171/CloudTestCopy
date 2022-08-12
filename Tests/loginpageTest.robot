*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObjects/loginpage.robot
Resource    ../PageObjects/dashboardpage.robot
Resource    ../Libraries/commonutility.robot
Resource    ../Libraries/TestData.robot
Library    ../Libraries/Zephyrcycle.py
Library    ../Libraries/Zephyrscale.py

#Suite Setup     ${testcycle}    Set Suite Variable    Create Cycle    
Suite Setup        Zephyr test cycle
Test Teardown      Zephyr Result

*** Variables ***
${staffusername}             shahavp71@gmail.com
${staffpassword}             Jci@12345
${passwordresetemail}        vshahaqa@gmail.com
${testcycle}                 
${zephyr}                    on
${project}                   CLOUDV
${browserid}

*** Test Cases ***
CLOUDV-T2384: Verify Cloudvue Manager Valid Login
    commonutility.Open Web Browser    ${cloudvuemanagerURL}    ${browser}
    loginPage.Input User Name    ${staffusername}
    loginPage.Input password    ${staffpassword}
    #loginPage.Click on Login Button
    #commonutility.Verify Legacy Notice is present
    #Sleep    3
    #dashboardpage.Logout from cloudvuemanager
    #Log To Console    ${testcycle}
    Close Browser

    #Author: Vishal Shaha

#CLOUDV-T2385: Verify forgot password functionality
    #commonutility.Open Web Browser    ${cloudvuemanagerURL}    ${browser}
    #loginpage.Click on Forgot password
    #loginpage.Verify the Forgot Password page UI
    #loginpage.Verify valid password Reset    ${passwordresetemail}
    #Close Browser

    #Author: Vishal Shaha

#CLOUDV-T2386: Verify register page
    #commonutility.Open Web Browser    ${cloudvuemanagerURL}    ${browser}
    #loginpage.Click on Register link
    #loginpage.Verify the register page UI
    #loginpage.Verify register page input text boxes
    #sleep    2
    #loginpage.Click on the register page cancel button
    #Close Browser

    #Author: Vishal Shaha


*** Keywords ***





