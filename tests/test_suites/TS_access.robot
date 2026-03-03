*** Settings ***
Resource    ../ressources/browser.resource

*** Test Cases ***
# Test de base pour vérifier que l'application est accessible
Vérifier que la page de connexion est accessible
    Ouvrir le navigateur
    Page Should Contain Element    xpath=//*[@data-testid="btn-login"]
    Fermer le navigateur