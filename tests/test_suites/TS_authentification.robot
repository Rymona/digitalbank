# Test suite contenant les scénarios métiers d'authentification

*** Settings ***
# Importer les définitions de pas spécifiques aux authentifications
Resource    ../ressources/browser.resource
Resource    ../step_defs/step_authentification.resource

#  s'exécute avant chaque test de cette suite, lance le keyword pour ouvrir le navigateur
Test Setup    Ouvrir le navigateur
#  s'exécute après chaque test de cette suite, ferme le navigateur
Test Teardown    Fermer le navigateur

*** Test Cases ***
# Premier scénario fonctionnel d'authentification valide sans double authentification
Connexion valide sans 2FA
    Etant donné que l'utilisateur est sur la page de connexion
    Quand il saisit "test@digitalbank.fr" dans le champ email
    Et il saisit "Test1234!" dans le champ mot de passe
    Et il clique sur le bouton se souvenir de moi
    Et il clique sur le bouton de connexion
    Alors il est redirigé vers la page d'accueil

#Deuxième scénario fonctionnel d'authentification valide avec double authentification
Connexion valide avec 2FA
    Etant donné que l'utilisateur est sur la page de connexion
    Quand il saisit "marie.martin@email.com" dans le champ email
    Et il saisit "SecurePass456!" dans le champ mot de passe
    Et il clique sur le bouton se souvenir de moi
    Et il clique sur le bouton de connexion
    Alors il est redirigé vers la page de saisie du code 2FA
    Quand il saisit "123456" dans le champ de saisie du code 2FA
    Et il clique sur le bouton vérifier
    Alors il est redirigé vers la page d'accueil

# Troisième scénario fonctionnel d'authentification invalide avec mot de passe incorrect
Connexion invalide avec mot de passe incorrect
    Etant donné que l'utilisateur est sur la page de connexion
    Quand il saisit "test@digitalbank.fr" dans le champ email
    Et il saisit "MotDePasseIncorrect!" dans le champ mot de passe
    Et il clique sur le bouton de connexion
    Alors un message d'erreur "Email ou mot de passe incorrect" est affiché

# Quatrième scénario non fonctinnel, test d'accessibilité, vérifification que les champs de saisie ont des labels associés
Vérification de l'accessibilité des champs de saisie
    Etant donné que l'utilisateur est sur la page de connexion
    Alors le champ email a un label associé
    Et le champ mot de passe a un label associé

# Cinquième scénario non fonctionnel, test d'éco conception, vérification que la page de connexion ne se recharge pas complètement après une tentative de connexion infructueuse
Vérification de l'éco conception de la page de connexion
    Etant donné que l'utilisateur est sur la page de connexion
    Quand il saisit "test@digitalbank.fr" dans le champ email
    Et il saisit "MotDePasseIncorrect!" dans le champ mot de passe
    Et il clique sur le bouton de connexion
    Alors un message d'erreur "Email ou mot de passe incorrect" est affiché
    Et le champ email conserve la valeur "test@digitalbank.fr"