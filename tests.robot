*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Resource    keywords.robot

# Suite Setup    chromedriver setup
# Suite Setup    chrome headless setup
# Suite Setup    chrome for testing setup
# Suite Setup    edgedriver setup
Suite Setup    firefox setup
# Suite Setup    firefox headless setup

Suite Teardown    Close Browser

*** Test Cases ***
smoke test
    Open Login Page

# login test
#     Open Login Page
#     Log In