*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary

*** Keywords ***
Cliquer sur le bouton "Virements"
    Scroll Element Into View    xpath=//button[@data-testid="tab-transfer"]
    Click Button    xpath=//button[@data-testid="tab-transfer"]

Je suis sur la page de virements
    Wait Until Page Contains Element    xpath=//h2[text()="Effectuer un virement"]

Sélection livret A dans le menu déroulant du compte créditeur
    Click Element    xpath=//select[@id="to-account"]
    Click Element    xpath=//select[@id="to-account"]/option[contains(text(),"Livret A")]

Rentrer un montant de virement
    [Arguments]    ${montant}
    Scroll Element Into View    xpath=//input[@id="amount"]
    Input Text    xpath=//input[@id="amount"]    ${montant}

Rentrer un motif de virement
    [Arguments]    ${motif}
    Scroll Element Into View    xpath=//input[@id="description"]
    Input Text    xpath=//input[@id="description"]    ${motif}

Appuyer sur le bouton "Effectuer le virement"
    Scroll Element Into View    xpath=//button[@data-testid="btn-submit-transfer"]
    Click Button    xpath=//button[@data-testid="btn-submit-transfer"]

Cliquer sur l'onglet "Mes comptes"
    Scroll Element Into View    xpath=//button[@data-testid="tab-dashboard"]
    Click Element    xpath=//button[@data-testid="tab-dashboard"]

Cliquer sur l'onglet virements externe
    Click Element    xpath=//button[@id="btn-transfer-external"]

Sélectionner le livret A dans le menu déroulant du compte débiteur
    Click Element    xpath=//select[@id="from-account"]
    Click Element    xpath=//select[@id="from-account"]/option[contains(text(),"Livret A")]

Choisir un compte bénéficiaire
    [Arguments]    ${nom_beneficiaire}
    Click Element    xpath=//div[text()="${nom_beneficiaire}"]

Vérification de l'affichage du message d'erreur lorsque le solde est insuffisant
    Scroll Element Into View    xpath=//div[@id="transfer-error"]
    Element Should Contain    xpath=//div[@id="transfer-error"]    Solde insuffisant pour effectuer ce virement

Cliquer sur le bouton "Ajouter un bénéficiaire"
    Scroll Element Into View    xpath=//button[@id="btn-add-beneficiary"]
    Click Button    xpath=//button[@id="btn-add-beneficiary"]

Vérifier que le bénéficiaire a été ajouté à la liste des bénéficiaires enregistrés
    [Arguments]    ${nom_beneficiaire}
    Element Should Be Visible    xpath=//div[@class="beneficiary-name" and text()="${nom_beneficiaire}"]

Vérification de la classe du message d'erreur pour un virement avec solde insuffisant
    Scroll Element Into View    xpath=//div[@id="transfer-error"]
    Element Should Contain    xpath=//div[@id="transfer-error"]    Solde insuffisant pour effectuer ce virement
    ${classe}=    Get Element Attribute    xpath=//div[@id="transfer-error"]    class
    Should Contain    ${classe}    alert-error    class    alert-error