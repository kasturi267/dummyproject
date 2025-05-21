*** Settings ***
Resource    ../resources/AppResource.resource
Resource    ../resources/storeResource.resource
Suite Setup    LaunchApp

*** Test Cases ***
Valid Login Test
    Click Login
    Enter Username
    Enter Password
    Click LoginBtn
    Verify Successful Login

Select And Remove product
    Add Item To Cart Multiple Times    ${iphonelink}    2
    Click Cart
    Remove Product

Select Product Test
    Click Home
    Add Item To Cart Multiple Times    ${iphonelink}    1
    Click Cart
    Check Items Listed in Cart

Confirm Order Test
    Click PlaceOrder
    Provide Product Details
    Click Purchase
    Verify Order Summary