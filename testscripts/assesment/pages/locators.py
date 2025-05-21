#login locators
loginCard = "id=login2"
userNameTextField = "id=loginusername"
passwordTextField = "id=loginpassword"
loginButton = "button:has-text(\"Log in\")"
successMessage = "id=nameofuser"

#home page locators
homecard = "xpath=//li[@class=\"nav-item active\"]/a[normalize-space(text())=\"Home\"]"
iphonelink =  "a.hrefch:has-text(\"Iphone 6 32gb\")"
Sonyvaioi5link = "a.hrefch:has-text(\"Sony vaio i5\")"
addToCartButton = "xpath=//a[text()=\"Add to cart\"]"

#cart locators
cartCard = "id=cartur"
cartRow =  "xpath=//tbody[@id=\"tbodyid\"]/tr"
titleCell =  "xpath=./td[2]"
deleteLink =  "xpath=./td[4]/a"

#place order locators
placeOrderButton = "button.btn.btn-success"
nameTextField = "id=name"
countryTextField = "id=country"
cityTextField = "id=city"
creditCardTextField = "id=card"
monthTextField = "id=month"
yearTextField = "id=year"
purchaseButton = "css=button.btn.btn-primary[onclick=\"purchaseOrder()\"]"
checkoutComplete = "xpath=//div[contains(@class, \"sweet-alert\")]//h2"