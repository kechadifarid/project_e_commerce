*** Settings ***
Documentation    page de paiement
Library    SeleniumLibrary
*** Variables ***
${email}    css=[data-testid="billing-email"]
${phone}    css=[data-testid="billing-phone"]
${add}    css=[data-testid="billing-address"]
${city}    css=[data-testid="billing-city"]
${zipcode}    css=[data-testid="billing-zipcode"]
${country}    css=[data-testid="billing-country"]
${cardNum}    css=[data-testid="card-number"]
${cvv}    css=[data-testid="card-cvv"]
${fullname}    css=[data-testid="card-name"]
${date}    css=[data-testid="card-expiry"]
${btnOrder}    css=[data-testid="place-order"]
${msgsucess}    css=[data-testid="payment-success"]
${downloadBtn}    css=[data-testid="download-invoice"]
*** Keywords ***
remplir formulaire
    [Arguments]    ${emailV}    ${phoneV}    ${addV}    ${cityV}    ${zipcodeV}    ${cardNumV}     ${cvvV}    ${fullnameV}    ${dateV}    
    Input Text    ${email}    ${emailV}
    Input Text    ${phone}    ${phoneV}
    Input Text    ${add}    ${addV}
    Input Text    ${city}    ${cityV}
    Input Text    ${zipcode}    ${zipcodeV}
    Select From List By Label    ${country}    France    
    Input Text    ${cardNum}    ${cardNumV}
    Input Text    ${cvv}    ${cvvV}
    Input Text    ${fullname}    ${fullnameV}
    Input Text    ${date}    ${dateV}
    Click Button    ${btnOrder}
getmsgsuccess
    ${msg}    Get Text    ${msgsucess}
    RETURN    ${msg}   
clickBtnDown
    Click Element    ${downloadBtn}