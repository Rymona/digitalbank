*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary

*** Keywords ***
Je suis sur la page d'ajout de bénéficiaire
    Wait Until Page Contains Element    xpath=//h3[text()="Ajouter un bénéficiaire"]

Rentrer le nom du bénéficiaire
    [Arguments]    ${nom_beneficiaire}
    Input Text    xpath=//input[@id="ben-name"]    ${nom_beneficiaire}

Rentrer l'IBAN du bénéficiaire
    [Arguments]    ${iban_beneficiaire}
    Input Text    xpath=//input[@id="ben-iban"]    ${iban_beneficiaire}

Cliquer sur le bouton "Ajouter"
    Click Button    xpath=//button[@id="btn-save-beneficiary"]