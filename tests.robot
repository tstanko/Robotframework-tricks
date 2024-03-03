*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Resource    keywords.robot

Suite Setup    chromedriver setup
# Suite Setup    chrome headless setup
# Suite Setup    edgedriver setup
# Suite Setup    firefox headless setup
# Suite Setup    firefox setup

Suite Teardown    Close Browser

*** Test Cases ***
# Smoke test
#     Open Login Page

# Login test
#     Open Login Page
#     Log In

Switching tabs test
    Switch tabs

Using_iframe_test
    Use iframe