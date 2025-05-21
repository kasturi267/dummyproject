*** Settings ***
Library           Browser

*** Variables ***
${baseUrl}        https://www.demoblaze.com/
${browser}        chromium

*** Keywords ***
LaunchApp
    Open Browser    ${baseUrl}    ${browser}

CloseApp
    Close Browser