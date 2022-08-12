*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${USERNAME}    vishal_Yj93pt    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    rGsfJG6dJHpee7QFSuAW    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${cloudvuemanagerURL}        https://dev-dashboard.cloudvue.com/login
${browser}                   chrome    #Chrome, Firefox, IE, Safari, Edge, Opera
${platform}                  bstack    #This variable is created to run test cases on bstack or local browser
