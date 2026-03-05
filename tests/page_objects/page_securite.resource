*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary


*** Keywords ***
Je suis sur la page sécurité
    # Vérifier que l'utilisateur est bien sur la page de paramètres de sécurité
    Wait Until Page Contains Element    xpath=//h2[text()="Paramètres de sécurité"]    timeout=10s

Cliquer sur le bouton "Modifier le mot de passe"
    # Cliquer sur le bouton "Modifier le mot de passe" pour accéder à la page de modification du mot de passe
    Click Button    xpath=//button[@id="btn-change-password"]

Le message de confirmation "Mot de passe modifié avec succès" est affiché
    # Vérifier que le message de confirmation est affiché après la modification du mot de passe
    Scroll Element Into View    xpath=//div[@id="security-success"]
    Wait Until Page Contains Element    xpath=//div[@id="security-success"]    timeout=10s
    Element Should Contain    xpath=//div[@id="security-success"]    Mot de passe modifié avec succès

Je clique sur le bouton de déconnexion
    # Cliquer sur le bouton de déconnexion pour se déconnecter du compte
    Click Button    xpath=//button[@id="btn-logout"]

Cliquer sur le bouton Activation/Désactivation 2FA
    # Cliquer sur le bouton pour activer ou désactiver la fonctionnalité 2FA
    Click Element    xpath=//span[@class="toggle-slider"]

Affichage du message de confirmation "Double authentification désactivéé"
    # Vérifier que le message de confirmation est affiché après la désactivation de la fonctionnalité 2FA
    Wait Until Page Contains Element    xpath=//div[@id="security-success"]    timeout=10s
    Element Should Contain    xpath=//div[@id="security-success"]    Double authentification désactivée

Label associé au message de confirmation "changement de mot de passe" est accessible et visible
    # Vérifier que le message a un label associé pour l'accessibilité
    Element Should Be Visible    xpath=//*[@data-testid="security-success"]