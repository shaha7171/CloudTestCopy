*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../PageObjects/loginpage.robot
Resource    ../PageObjects/dashboardpage.robot
Resource    ../Libraries/commonutility.robot
Resource    ../Libraries/TestData.robot

*** Variables ***
${staffusername}             shahavp71@gmail.com
${staffpassword}             Jci@12345
${passwordresetemail}        vshahaqa@gmail.com


*** Test Cases ***
