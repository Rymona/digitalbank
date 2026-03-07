*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary

*** Keywords ***
La page de confirmation de facture est affichée
    Wait Until Page Contains Element    xpath=//h3[text()="Confirmer le paiement"]

Cliquer sur confirmer le paiement
    Click Button    xpath=//button[@id="btn-confirm-payment"]