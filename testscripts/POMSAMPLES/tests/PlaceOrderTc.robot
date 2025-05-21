*** Settings ***
Resource    ../resources/AppResource.resource
Resource    ../resources/LoginPageResource.resource
Resource    ../resources/ProductListPageResource.resource
Resource    ../resources/CartPageResource.resource
Resource    ../resources/ChkOutPageResource.resource
Suite Setup    LaunchApp
 
*** Test Cases ***
Valid Login Test
    Enter Username
    Enter Password
    Click LoginBtn
    Verify Successful Login

Select Product Test
    Add Item to Cart
    View Cart
    Check Items Listed in Cart
    Remove Items

Confirm Order Test in demo url
    Run Keyword If    Check Items Listed in Cart    Add Item to Cart
    Checkout Items
    Provide User Details
    Confirm Order
    Verify Order Summary
