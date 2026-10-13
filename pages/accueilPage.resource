*** Settings ***
Documentation    la page d'accueil
Library    SeleniumLibrary
*** Variables ***
${list}    css:[data-testid="category-filter"]
${checkStock}    css:[data-testid="in-stock-toggle"]
${addToCartElem}    css:[data-testid="add-to-cart-2"]
${cartBtn}    css=[data-testid="cart-button"]
*** Keywords ***
selectElectronics
    Select From List By Value    ${list}    Electronics
checkElem
    Click Element    ${checkStock} 
clickElem
    Click Button    ${addToCartElem}
getMsgBtn
    ${msg}    Get Text    ${cartBtn}
    RETURN    ${msg}
clickBtnCart
    Execute JavaScript    window.scrollTo(0, 0)
    Wait Until Element Is Visible    ${cartBtn}    10s
    Click Element    ${cartBtn}