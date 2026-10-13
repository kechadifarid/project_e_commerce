*** Settings ***
Documentation    FIchier des keywords 
Library    SeleniumLibrary
Library    OperatingSystem
*** Variables ***
${DOWNLOAD_DIR}    ${EXECDIR}/Downloads
*** Keywords ***
init browser
    Create Directory    ${DOWNLOAD_DIR}
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}=    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}
    ...                              download.prompt_for_download=${False}
    ...                              directory_upgrade=${True}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    
    Open Browser    url=https://practiceautomatedtesting.com/shopping    browser=chrome    options=${chrome_options}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
fermer browser  
    Close Browser
