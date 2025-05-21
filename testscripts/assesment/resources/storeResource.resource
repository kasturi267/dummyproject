*** Settings ***
Resource        AppResource.resource
Variables       ../pages/locators.py
 
*** Variables ***
${username}     autotesting
${pwd}          test
${userNametext}    Welcome autotesting
${iphoneText}    Iphone 6 32gb

${name}    devil
${country}    India
${city}    bangalore
${creditCard}    8438864774
${month}    july
${year}    2025

${orderSuccessMessage}      Thank you for your purchase!
 
*** Keywords ***
Click Login
    Click    ${loginCard}
Enter Username
    Type Text    ${userNameTextField}    ${username}
 
Enter Password
    Type Text    ${passwordTextField}    ${pwd}

Click LoginBtn
    Click    ${loginButton}

Verify Successful Login
    sleep    5s
    ${actual}=    Get Text    ${successMessage}
    Should Be Equal As Strings    ${actual}    ${userNametext}

# Add Item to Cart
#     Click    ${iphonelink}
#     Wait For Elements State    ${addToCartButton}
#     Click    ${addToCartButton}

Add Item To Cart Multiple Times
    [Arguments]    ${itemLink}    ${times}
    FOR    ${index}    IN RANGE    ${times}
        Click    ${itemLink}
        Wait For Elements State    ${addToCartButton}
        Click    ${addToCartButton}
        Sleep    5s
        Click Home
    END

Click Cart
    Sleep    10s
    Wait For Elements State    ${cartCard}
    Click    ${cartCard}

Click Home
    Sleep    5s
    Wait For Elements State    ${homecard}
    Click    ${homecard}

Check Items Listed in Cart
    Wait For Elements State    ${cartRow}
    ${itemsList}=    Get Elements    ${cartRow}
    ${itemsCount}=   Get Length      ${itemsList}
    Should Be True   ${itemsCount} > 0    Items are listed in the cart

Remove Product
    ${rows}=    Get Elements    ${cartRow}
    FOR    ${row}    IN    @{rows}
        ${title}=    Get Text    ${row}>>${titleCell}
        IF    "${iphoneText}" in "${title}"
            Click    ${row}>>${deleteLink}
            Log    Deleted row with title: ${title}
        END
    END

Click PlaceOrder
    Wait For Elements State    ${placeOrderButton}
    Click    ${placeOrderButton}

Provide Product Details
    Type Text    ${nameTextField}    ${name}
    Type Text    ${countryTextField}    ${country}
    Type Text    ${cityTextField}    ${city}
    Type Text    ${creditCardTextField}    ${creditCard}
    Type Text    ${monthTextField}    ${month}
    Type Text    ${yearTextField}    ${year}

Click Purchase
    Click    ${purchaseButton}
    Sleep    10s

Verify Order Summary
    ${actualMessage}=    Get Text    ${checkoutComplete}
    Should Be Equal    ${actualMessage}    ${orderSuccessMessage}