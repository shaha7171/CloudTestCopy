*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObjects/dashboardpage.robot
Resource    ../Libraries/commonutility.robot

*** Variables ***
${staffusernameid}            id:loginEmail
${staffpasswordid}            id:loginPassword
${loginbtn}                   xpath://button[@type="submit"]
${forgotpasswordlink}         xpath://span[text() = "Forgot Password?"]
${resetpasswordtext}          xpath://span[text() = "Reset Password"]
${passwordresetemailID}       id:ResetPasswordEmail
${forgotpasswordsubmitbtn}    xpath://span[normalize-space()="Submit"]
${Registerlink}               xpath://span[text()="Register"]
${RegisteremailID}            id:RegisterEmail
${RegisterpasswordID}         id:RegisterPassword
${RegiserconfimationpasswordID}    id:RegisterConfirmPassword
${RegisterfirstNameID}        id:RegisterFirstName
${RegisterlastNameID}         id:RegisterLastName
${RegisterpartnernameID}      id:RegisterPartnerName
${Registersubmitbtn}          xpath://span[text()="Submit"]  


*** Keywords ***
#Open Cloudvue Manager Login Page
    #[Documentation]    Opening cloudvuemanager Login Page
    #[Arguments]    ${cloudvuemanagerURL}    ${browser}
    #Open Browser    ${cloudvuemanagerURL}    ${browser}    remote_url=${REMOTE_URL}    desired_capabilities=&{DC}
    #Maximize Browser Window
    #Open Web Browser    ${cloudvuemanagerURL}    ${browser}
    #Author: Vishal Shaha


Input User Name
    [Documentation]    The objective of this method is to write the staff email ID
    [Arguments]    ${staffusername}
    Click Element    ${staffusernameid}
    Input Text    ${staffusernameid}    ${staffusername}
    #Author: Vishal Shaha

Input password
    [Documentation]    The objective of this method is to write the staff Login password
    [Arguments]    ${staffpassword}
    Input Text    ${staffpasswordid}    ${staffpassword}
    #Author: Vishal Shaha

Click on Login Button
    [Documentation]    The objective of this method is to click on the login Button
    Click Button    ${loginbtn}
    #Author: Vishal Shaha

Verify Invalid error message
    [Documentation]    The objective of this test case is to verify invalid error message for login 
    [Arguments]   ${element}
    ${status}=    Run Keyword And Return Status    Click Element    ${element}
    IF    "${status}"=="True"
            Log To Console    Login button is not clickable because of the empty field    
    ELSE
        Page Should Contain    Login error. Please try again.
    END
      #Author: Vishal Shaha

Click on Forgot password
    [Documentation]    The objective of this method is to ro click on the forgot password link
    Click Element    ${forgotpasswordlink}
    #Author: Vishal Shaha

Verify the Forgot Password page UI
    [Documentation]     The objective of this method is to verify forgot password UI
    #Page Should Contain Element    ${resetpasswordtext}
    Page Should Contain Element    xpath://span[text() = "Reset Password"]
    Title Should Be    Cloudvue Manager
    Location Should Contain    resetpassword
    #Author: Vishal Shaha

Verify valid password Reset 
    [Documentation]    The objective of this method is to verify valid password reset functionality 
    [Arguments]    ${passwordresetemail}
    Input Text    ${passwordresetemailID}    ${passwordresetemail}
    Click Element    ${forgotpasswordsubmitbtn}
    Page Should Contain Element    //span[normalize-space()='Please check your email for a password reset link']
    Click Element    //span[normalize-space()="Ok"]
    Location Should Contain    login
    #Author: Vishal Shaha


Click on Register link
    [Documentation]    The objective of this method is to click on the Register functionality
    Click Element    ${Registerlink}
    #Author: Vishal Shaha

Verify the register page UI
    [Documentation]    The objective of the method is to verify UI of the Register page
    Page Should Contain Element    xpath://span[normalize-space()="Register a Staff"]
    Title Should Be    Cloudvue Manager
    Location Should Contain    register
    #Author: Vishal Shaha

Verify register page input text boxes
    [Documentation]    The objective of the method is to make sure that all register page input elements is working and allow user to enter data 
     
    ${Regiserpassword}    Generate Random String    10    [LOWER]
    ${Regiserfirstname}    Generate Random String    8    [LOWER]
    ${Regiserlastname}    Generate Random String    8    [LOWER]
    ${Regiserpartner}    Generate Random String    5    [UPPER]
    ${Regiseremail}    Catenate    SEPARATOR=    ${Regiserfirstname}    @endtest-mail.io
    
    Input Text    ${RegisteremailID}    ${Regiseremail}
    Input Text    ${RegisterpasswordID}    ${Regiserpassword}
    Input Text    ${RegiserconfimationpasswordID}    ${Regiserpassword}
    Input Text    ${RegisterfirstNameID}    ${Regiserfirstname}
    Input Text    ${RegisterlastNameID}    ${Regiserlastname}
    Input Text    ${RegisterpartnernameID}    ${Regiserpartner}
    #Author: Vishal Shaha

Click on the register page cancel button
    [Documentation]    The objective of the method is to click on the cancel button 
    Click Element    xpath://span[normalize-space()="Cancel"]
      #Author: Vishal Shaha


#Click on Register

#Click on Legal 

#Verify the version number 


    



