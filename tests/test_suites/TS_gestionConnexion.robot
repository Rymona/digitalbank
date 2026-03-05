# Test suite contenant les scénarios métiers liés à la gestion de la connexion

*** Settings ***
# Importer les définitions de pas spécifiques aux authentifications
Resource    ../ressources/browser.resource
Resource    ../step_defs/step_gestionConnexion.resource
Resource    ../step_defs/step_authentification.resource

#  s'exécute avant chaque test de cette suite, lance le keyword pour ouvrir le navigateur
Test Setup    Ouvrir le navigateur
#  s'exécute après chaque test de cette suite, ferme le navigateur
Test Teardown    Fermer le navigateur

*** Test Cases ***
#Premier scénario fonctionel, modification du mote de passe et vérification que la modification est prise en compte
Modification du mot de passe et vérification de la prise en compte
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Sécurité"
    Alors il est redirigé vers la page de paramètres de sécurité
    Quand il clique sur le bouton "Modifier le mot de passe"
    Alors il est redirigé vers la page de modification du mot de passe
    Quand il saisit "Test1234!" dans le champ mot de passe actuel
    Et il saisit "NouveauMotDePasse123!" dans le champ nouveau mot de passe
    Et il saisit "NouveauMotDePasse123!" dans le champ confirmation du nouveau mot de passe
    Et il clique sur le bouton "Enregistrer"
    Alors un message de confirmation "Mot de passe modifié avec succès" est affiché
    Quand il se déconnecte de son compte
    Alors il est redirigé vers la page de connexion
    Se connecter avec "test@digitalbank.fr" et "NouveauMotDePasse123!"
    Alors il est redirigé vers la page d'accueil

#Deuxième scénario fonctionnel, désactivation de la fonctionnalité 2FA et vérification que la désactivation est prise en compte
Désactivation de la fonctionnalité 2FA et vérification de la prise en compte
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "marie.martin@email.com" et "SecurePass456!"
    Alors il est redirigé vers la page de saisie du code 2FA
    Quand il saisit "123456" dans le champ de saisie du code 2FA
    Et il clique sur le bouton vérifier
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Sécurité"
    Alors il est redirigé vers la page de paramètres de sécurité
    Quand il clique sur le bouton "Désactiver 2FA"
    Alors un message de confirmation "Double authentification désactivéé" est affiché
    Quand il se déconnecte de son compte
    Alors il est redirigé vers la page de connexion
    Se connecter avec "marie.martin@email.com" et "SecurePass456!"
    Alors il est redirigé vers la page d'accueil

# Troisème scénario non fonctinnel, test d'accessibilité, vérifification que le message de confirmation après la modification du mot de passe est accessible et visible
Vérification de l'accessibilité du message de confirmation après la modification du mot de passe
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Sécurité"
    Alors il est redirigé vers la page de paramètres de sécurité
    Quand il clique sur le bouton "Modifier le mot de passe"
    Alors il est redirigé vers la page de modification du mot de passe
    Quand il saisit "Test1234!" dans le champ mot de passe actuel
    Et il saisit "NouveauMotDePasse123!" dans le champ nouveau mot de passe
    Et il saisit "NouveauMotDePasse123!" dans le champ confirmation du nouveau mot de passe
    Et il clique sur le bouton "Enregistrer"
    Alors un message de confirmation "Mot de passe modifié avec succès" est affiché
    Et le message de confirmation est accessible et visible

# Quatrième scénario non fonctionnel, test de sécurité, vérification que les mots de passe saisis dans les champs de modification du mot de passe sont masqués
Vérification de la sécurité des champs de modification du mot de passe
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Sécurité"
    Alors il est redirigé vers la page de paramètres de sécurité
    Quand il clique sur le bouton "Modifier le mot de passe"
    Alors il est redirigé vers la page de modification du mot de passe
    Et le champ de saisie du mot de passe actuel est de type "password"
    Et le champ de saisie du nouveau mot de passe est de type "password"
    Et le champ de saisie de la confirmation du nouveau mot de passe est de type "password"