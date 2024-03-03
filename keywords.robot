*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://demoqa.com/login
${LOGIN}    Rocky
${PASSWORD}    Boxing123#

*** Keywords ***
chromedriver setup
    Open Browser    browser=chrome    executable_path=chromedriver-win64\\chromedriver.exe
    Maximize Browser Window

chrome headless setup
    Open Browser    browser=headlesschrome    executable_path=chromedriver-win64\\chromedriver.exe
    Maximize Browser Window

chrome for testing setup
    Open Browser    browser=chrome    executable_path=chromedriver-win64\\chromedriver.exe
    Maximize Browser Window

edgedriver setup
    Open Browser    browser=edge    executable_path=msedgedriver.exe
    Maximize Browser Window

firefox headless setup    
    Open Browser    browser=headlessfirefox    executable_path=geckodriver.exe
    Maximize Browser Window

firefox setup    
    Open Browser    browser=firefox    executable_path=geckodriver.exe
    Maximize Browser Window
Open Login Page
    Go To    ${LOGIN URL}   
    ${popup}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[contains(text(), 'Witryna prosi')]
    Run Keyword If    ${popup} 
    ...    Click Element    xpath://*[text()='Zgadzam się']
    Title Should Be    DEMOQA

Log In
    Set Selenium Speed    1
    Wait Until Element Is Visible    id:userName
    Scroll Element Into View    id:Ad.Plus-970x250-2
    Input Text    id:userName    ${LOGIN}    true
    Input Password    id:password    ${PASSWORD}
    Click Button    id:login
    Wait Until Element Is Visible    id:gotoStore
    Sleep   2