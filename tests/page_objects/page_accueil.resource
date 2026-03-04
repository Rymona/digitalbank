*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary


*** Keywords ***
Je suis sur la page d'accueil
    # Vérifier que l'utilisateur est bien sur la page d'accueil après une connexion réussie
    Wait Until Page Contains Element    xpath=//*[@id="btn-logout"]    timeout=10s