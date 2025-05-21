*** Settings ***
Library     Browser
Library     Collections

*** Variables ***
${browser}      chromium
${url}          https://testautomationpractice.blogspot.com/ 

*** Test Cases ***
Checkbox Example
    Open Browser    ${url}    ${browser}
    Scroll To Element    \#sunday
    Check Checkbox    \#sunday
    Check Checkbox    \#monday
    Check Checkbox    \#tuesday

    Get Checkbox State    \#sunday    ==    True
    Uncheck Checkbox    \#sunday
    Sleep    2s   

Radiobutton Example
    Open Browser    ${url}    ${browser}
    Check Checkbox    \#female
    ${gender}    Get Text    \#gender
    Run Keyword If    '${gender}' == 'female'    Log    Gender is female
    Get Checkbox State    \#female    ==    True

dropdown examples
    Open Browser    ${url}    ${browser}
    Scroll To Element    \#country
    Select Options By    \#country    label    Japan
    ${countries}    Get Select Options    \#country
    Log Many    ${countries}

    Select Options By    \#country    Index    3
    ${selected}    Get Selected Options   \#country
    Wait For Elements State    \#country    selected
    Log Many    ${selected}

Test Case to select values from List
    Open Browser    ${url}    ${browser}
    Scroll To Element    \#animals
    Select Options By    \#animals    label    Cat    Elephant    Dog
    ${selected}    Get Selected Options   \#animals
    Wait For Elements State    \#animals    selected 
    Log Many    ${selected}   

Shadow DOM Example


    ${DOMElem}    Get Element    guid-generator > input#editField
    Type Text    ${DOMElem}    Welcome
    Click    guid-generator > button#buttonGenerate

    ${DomText}    Get Text    guid-generator > input#editField
    Log To Console    message=${DomText}

Handling Alerts Example
    Open Browser    ${url}    ${browser}
    ${promise} =    Promise To    Wait For Alert    action=accept    text= I am an alert box!
    Click    \#alertBtn
    ${text} =    Wait For    ${promise}


    ${promise} =    Promise To    Wait For Alert    action=accept    text= Press a button!
    Click    \#confirmBtn
    ${text} =    Wait For    ${promise}

    ${promise} =    Promise To    Wait For Alert    action=accept    prompt_input=Hello Welcome
    Click    \#promptBtn
    ${text} =    Wait For    ${promise}  



