*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary


*** Keywords ***
Je suis sur la page de modification du mot de passe
    # Vérifier que l'utilisateur est bien sur la page de modification du mot de passe
    Wait Until Page Contains Element    xpath=//h3[text()="Modifier le mot de passe"]    timeout=10s

Je saisie le mot de passe actuel
    # Saisir le mot de passe actuel dans le champ correspondant
    [Arguments]    ${mot_de_passe_actuel}
    Input Text    xpath=//input[@id="current-pwd"]    ${mot_de_passe_actuel}

Je saisie le nouveau mot de passe
    # Saisir le nouveau mot de passe dans le champ correspondant
    [Arguments]    ${nouveau_mot_de_passe}
    Input Text    xpath=//input[@id="new-pwd"]    ${nouveau_mot_de_passe}

Je saisie la confirmation du nouveau mot de passe
    # Saisir la confirmation du nouveau mot de passe dans le champ correspondant
    [Arguments]    ${nouveau_mot_de_passe}
    Input Text    xpath=//input[@id="confirm-pwd"]    ${nouveau_mot_de_passe}

Cliquer sur le bouton "Enregistrer"
    # Cliquer sur le bouton "Enregistrer" pour valider la modification du mot de passe
    Click Button    xpath=//button[@data-testid="btn-save-password"]

Le champ de mot de passe actuel est de type "password"
    # Vérifier que le champ de saisie du mot de passe actuel est de type "password" pour masquer les caractères saisis
    Element Attribute Value Should Be    xpath=//input[@id="current-pwd"]    type    password

Le champ de nouveau mot de passe est de type "password"
    # Vérifier que le champ de saisie du nouveau mot de passe est de type "password" pour masquer les caractères saisis
    Element Attribute Value Should Be    xpath=//input[@id="new-pwd"]    type    password

Le champ de confirmation du nouveau mot de passe est de type "password"
    # Vérifier que le champ de saisie de la confirmation du nouveau mot de passe est de type "password" pour masquer les caractères saisis
    Element Attribute Value Should Be    xpath=//input[@id="confirm-pwd"]    type    password