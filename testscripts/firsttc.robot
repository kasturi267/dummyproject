*** Settings ***
# Library    Browser    auto_closing_level=TEST
Library    Browser

*** Variables ***
${browser}      chromium
${username}     tomsmith
${password}     SuperSecretPassword!
${url}          https://the-internet.herokuapp.com/login

*** Test Cases ***
Login To The Internet HerokuApp
    New Browser    ${browser}    headless=false
    New Context    viewport={'width': 1620, 'height': 1080}
    New Page       ${url}

    Type Text      \#username    ${username}
    Type Text      \#password    ${password}
    Click          \#login >> .radius

    ${pageTitle}=  Get Title
    Should Be Equal    ${pageTitle}    The Internet
    ${pageTitle}=  Get Title    ==    The Internet
    Log To Console     ${pageTitle}

    ${currentUrl}=     Get Url
    Should Contain     ${currentUrl}    secure
    ${currentUrl}=     Get Url    *=    secure
    Log To Console     ${currentUrl}
