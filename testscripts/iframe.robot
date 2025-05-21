*** Settings ***
Library    Browser

*** Variables ***
${browser}      chromium
${url}          https://the-internet.herokuapp.com/iframe

*** Test Cases ***
Testing Iframe Example
    Open Browser    ${url}    ${browser}
    ${label}    Get Text    div > h3
    Log    The text is : ${label}

    ${txtfromFrame}    Get Text    iframe#mce_0-ifr >>> id=tinymce
    Log    ${txtfromFrame}

    ${txtfromFrame}    Get Text    span.tox-statusbar_branding
    Log    ${txtfromFrame}


handled tabbed windows
    New Browser    chromium    headless=False
    New Context    viewport={"width": 1920, "height": 1080}
    New Page    https://the-internet.herokuapp.com/windows
    Sleep    30s
    @{parentPageID}    Get Page Ids    ACTIVE
    Click    text=/^Click Here/

    ${childWinHandle} =    Switch Page    NEW
    Sleep    5s
    Get Title    ==    New Window
    Close Page
    @{pageIds}    Get Page Ids    CURRENT
    Switch Page    ${parentPageID}[0]
    Get Title    ==    The Internet
    Log    ${pageIds}
    Sleep    5s
    Close Page

Take And Embed Screenshot
     Open Browser    https://the-internet.herokuapp.com/windows    ${browser}
     Take Screenshot    fullPage=False    filename=test    fileType=jpeg    quality=80
 
     Take Screenshot    EMBED


For Loop In Range Test
    Open Browser    https://www.demoblaze.com/#    chromium
    Sleep    15s
    @{elements_List}    Get Elements    h4.card-title a
    ${itemcount}    Get Element Count    h4.card-title a
    Log To Console    ${itemcount}
    Log To Console    "Elements are:"@{elements_List}
    FOR    ${element}    IN    @{elements_List}
        ${elementText}    Get Text    ${element}
        Log    ${elementText}
        Run Keyword If    '${elementText}' == 'Samsung galaxy s7'    Click    ${element}
        BREAK
    END
    Close Browser