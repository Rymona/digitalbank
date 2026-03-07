# Ce fichier définit les étapes pour les tests liés à l'authentification

*** Settings ***
# Importer les définitions des pages nécessaires
Resource    ../page_objects/page_connexion.resource
Resource    ../page_objects/page_accueil.resource
Resource    ../page_objects/page_connexion_2FA.resource

*** Keywords ***
Etant donné que l'utilisateur est sur la page de connexion
    Ouvrir la page de connexion

Quand il saisit "${email}" dans le champ email
    Saisir email    ${email}

Et il saisit "${mot_de_passe}" dans le champ mot de passe
    Saisir mot de passe    ${mot_de_passe}

Et il clique sur le bouton se souvenir de moi
    Cliquer sur le bouton se souvenir de moi

Et il clique sur le bouton de connexion
    Cliquer sur le bouton connexion

Alors il est redirigé vers la page de saisie du code 2FA
    Je suis sur la page de connexion 2FA

Quand il saisit "${code_2fa}" dans le champ de saisie du code 2FA
    Saisir code 2FA    ${code_2fa}

Et il clique sur le bouton vérifier
    Cliquer sur le bouton vérifier

Alors il est redirigé vers la page d'accueil
    Je suis sur la page d'accueil

Alors un message d'erreur "Email ou mot de passe incorrect" est affiché
    # Vérifier que le message d'erreur est affiché après une tentative de connexion infructueuse
    Wait Until Page Contains    Email ou mot de passe incorrect    timeout=10s

Alors le champ email a un label associé
    # Vérifier que le champ email a un label associé pour l'accessibilité
    Element Should Be Visible    xpath=//label[@for="email"]

Et le champ mot de passe a un label associé
    # Vérifier que le champ mot de passe a un label associé pour l'accessibilité
    Element Should Be Visible    xpath=//label[@for="password"]

Et le champ email conserve la valeur "${email}"
    # Vérifier que le champ email conserve la valeur saisie après une tentative de connexion infructueuse
    ${email_value}=    Get Value    xpath=//input[@id="email"]
    Should Be Equal    ${email_value}    ${email}

Se connecter avec "${email}" et "${mot_de_passe}"
    # Keyword réutilisable pour se connecter avec des identifiants spécifiques
    Quand il saisit "${email}" dans le champ email
    Et il saisit "${mot_de_passe}" dans le champ mot de passe
    Et il clique sur le bouton de connexion