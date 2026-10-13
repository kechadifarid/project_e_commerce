*** Settings ***
Documentation    end to end
Resource    ../resources/keywords.resource
Resource    ../pages/accueilPage.resource
Resource    ../pages/paymentPage.resource
Library    OperatingSystem
Test Setup    init browser
Test Teardown    fermer browser
*** Test Cases ***
e2e
    selectElectronics
    checkElem
    clickElem
    ${msg}    getMsgBtn
    Should Contain    ${msg}    1 items
    clickBtnCart
    remplir formulaire    kechadifarid@gmail.fr    0620202020    1 rue de paris    paris    75000    4242 4242 4242 4242    123    kechaid farid    10/33
    ${msgsucc}    getmsgsuccess
    Should Contain    ${msgsucc}    Payment Successful
    Remove Files    ${DOWNLOAD_DIR}/*.tmp
    clickBtnDown 
    ${file}=    List Files In Directory   ${DOWNLOAD_DIR}
    Should Not Be Empty    ${file}
