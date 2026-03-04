*** Settings ***
Resource    ../ressources/browser.resource


*** Keywords ***
Ouvrir la page de connexion
    Go To    ${BASE_URL}
    Wait Until Page Contains Element    xpath=//*[@data-testid="btn-login"]    timeout=10s

Saisir email
# Saisir un email dans le champ de saisie d'email
    [Arguments]    ${email}
    Input Text    xpath=//input[@id="email"]    ${email}

Saisir mot de passe
# Saisir un mot de passe dans le champ de saisie de mot de passe
    [Arguments]    ${password}
    Input Text    xpath=//input[@id="password"]    ${password}

Cliquer sur le bouton se souvenir de moi
    # Cliquer sur le bouton "Se souvenir de moi" pour tester cette fonctionnalité
    Click Element    xpath=//input[@id="remember"]

Cliquer sur le bouton connexion
    # Cliquer sur le bouton "Se connecter" permet d'aller à la page d'accueil
    Click Button    xpath=//*[@data-testid="btn-login"]