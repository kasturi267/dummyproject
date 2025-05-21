*** Settings ***
Library     Browser
Library     Collections
Test Tags    temp1
Default Tags    ready  

*** Test Cases ***
Login Using Implicit Selectors
    [Documentation]    Test login using implicit (CSS) selectors.
    [Tags]    test1    test2
    Open Browser    https://www.saucedemo.com/    chromium

    Type Text    \#user-name           standard_user
    Type Text    //input[@name='password']    secret_sauce
    Click              "Login"
    Log    testing

Finding Elements by Explicit Selectors 

    [Documentation]    This test case demonstrates how to find elements by locator using RegEx.
    [Tags]

    Open Browser    https://testautomationpractice.blogspot.com/    chromium


    Type Text    css=#user-name           standard_user
    Type Text    xpath=//input[@name='password']    secret_sauce          
    Click    text="Login"

    @{items}    Get Elements    .inventory_item_name
    # ${first_item}    Get From List    @{items}  0
    ${first_item}    Get From List    ${items}    0
    ${item_text}    Get Text    ${first_item}    ==    Sauce Labs
    Log    ${item_text}
    Log    empty testing


Finding Elements By Explicit Selectors With RegEx
    [Documentation]    This test case demonstrates how to find elements by locator using regular expressions.
    Open Browser    https://testautomationpractice.blogspot.com/    chromium


    Click    text=/^Playwright.*$/i

    ${pageHeading}    Get Element    //div[@class='post-outer']/div[1] >> .post-title.en
    Get Text    ${pageHeading}    ==    PlaywrightPractice




