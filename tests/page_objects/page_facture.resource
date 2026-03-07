*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary

*** Keywords ***
La page de factures est affichée
    Wait Until Page Contains Element    xpath=//h2[text()="Factures à payer"]

Cliquer sur la facture la plus ancienne
    Click Button    xpath=//button[@data-testid="btn-pay-bill-1"]

La facture la plus ancienne est passée dans la liste des factures payées
    Wait Until Element Is Visible    xpath=//div[@data-testid="paid-bills"]//div[@data-testid="bill-paid-1"]    10s