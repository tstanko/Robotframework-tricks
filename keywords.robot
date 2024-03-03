*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://demoqa.com/login
${LOGIN}    Rocky
${PASSWORD}    Boxing123#
${FIRST TAB URL}    https://demoqa.com

*** Keywords ***
chromedriver setup
    Open Browser    browser=chrome    executable_path=chromedriver-win64\\chromedriver.exe
    Maximize Browser Window

chrome headless setup
    Open Browser    browser=headlesschrome    executable_path=chromedriver-win64\\chromedriver.exe
    Maximize Browser Window

edgedriver setup
    Open Browser    browser=edge    executable_path=msedgedriver.exe
    Maximize Browser Window

firefox setup    
    Open Browser    browser=firefox    executable_path=geckodriver.exe
    Maximize Browser Window
firefox headless setup    
    Open Browser    browser=headlessfirefox    executable_path=geckodriver.exe
    Maximize Browser Window

dismiss banner
    ${popup}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[contains(text(), 'Witryna prosi')]
    Run Keyword If    ${popup} 
    ...    Click Element    xpath://*[text()='Zgadzam się']

Open Login Page
    Set Selenium Timeout    5
    Go To    ${LOGIN URL}   
    dismiss banner
    Title Should Be    DEMOQA

Log In
    Set Selenium Speed    0.5
    Wait Until Element Is Visible    id:userName
    Input Text    id:userName    ${LOGIN}    true
    Input Password    id:password    ${PASSWORD}
    Click Button    id:login
    Wait Until Element Is Visible    id:gotoStore
    Sleep   2

switch tabs
    Set Selenium Speed    1
    Go To    ${FIRST TAB URL}
    dismiss banner
    Click Element    class:banner-image
   
    Switch Window    NEW  # switch to new tab 
    Title Should Be    Tools QA - Selenium Training                   
    Click Element    class:navbar__tutorial-menu
    Element Should Be Visible    xpath://*[(text()='DevOps Tools')]
   
    Switch Window       MAIN  # switch back to original tab
    Title Should Be    DEMOQA           
