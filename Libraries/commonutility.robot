*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ./TestData.robot
Resource        ../PageObjects/loginpage.robot
Resource        ../PageObjects/dashboardpage.robot
Library         ./Zephyrcycle.py
Library         ./Zephyrscale.py

*** Variables ***
${legacynotice}            xpath://span[contains(text(),"Notice")]
${LegacyNoticeOkayBtn}     xpath://span[normalize-space()="Ok"]
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
#&{DC}    os=Windows    os_version=10    browser=Chrome    browser_version=103.0.5060.134    build=RobotFramework    name=single_test
${os}    Windows
${browser_version}    latest-1
${OS_VERSION}    10

*** Keywords ***
Zephyr test cycle
    ${cycle}=    Create Cycle
    Set Suite Variable    ${testcycle}    ${cycle}

Open Web Browser
    [Documentation]    The objective of this method is to open browser on the browserstack or local based on the request
    [Arguments]    ${cloudvuemanagerURL}    ${browser}
    
    IF     "${platform}" == "bstack"
        #Open Browser    ${cloudvuemanagerURL}    ${browser}    remote_url=${REMOTE_URL}    desired_capabilities=&{DC}
        Open Browser    ${cloudvuemanagerURL}    ${browser}    remote_url=${REMOTE_URL}    desired_capabilities=browser:${browser},browser_version:${BROWSER_VERSION},os:${os},os_version:${OS_VERSION}
        ${browserid2}    Get Session Id
        Set Test Variable    ${browserid}    ${browserid2}
        
    ELSE IF    "${platform}" == "local"
        Open Browser    ${cloudvuemanagerURL}    ${browser}
    END   
    Maximize Browser Window

close web browser
    [Documentation]    This objective of this method is to close browser
    Close All Browsers


Verify Legacy Notice is present
    [Documentation]    The objective of this test case is to close legacy notification if it is preset on the screen
    Wait Until Element Is Visible    ${legacynotice}
    ${countLegacyNoticeElement}    SeleniumLibrary.Get Element Count    ${legacynotice}
    Log To Console    ${countLegacyNoticeElement}
    #Run Keyword 
    IF    ${countLegacyNoticeElement} > 0    
        Click Element    ${LegacyNoticeOkayBtn}    
    END



