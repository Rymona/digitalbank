*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary


*** Keywords ***
Je suis sur la page de connexion 2FA
    # Vérifier que l'utilisateur est bien sur la page de connexion 2FA
    Wait Until Page Contains Element    xpath=//*[@id="btn-verify-2fa"]    timeout=10s

Saisir code 2FA
    # Saisir un code 2FA dans le champ de saisie du code 2FA
    [Arguments]    ${code_2fa}
    Input Text    xpath=//*[@data-testid="2fa-code-0"]    ${code_2fa}

Cliquer sur le bouton vérifier
    # Cliquer sur le bouton "Vérifier" pour valider le code 2FA et accéder à la page d'accueil
    Click Button    xpath=//*[@id="btn-verify-2fa"]