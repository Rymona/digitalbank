# Test suite contenant les scénarios métiers liés aux virements

*** Settings ***
# Importer les définitions de pas spécifiques aux authentifications
Resource    ../ressources/browser.resource
Resource    ../step_defs/step_authentification.resource
Resource    ../step_defs/step_virements.resource

#  s'exécute avant chaque test de cette suite, lance le keyword pour ouvrir le navigateur
Test Setup    Ouvrir le navigateur
#  s'exécute après chaque test de cette suite, ferme le navigateur
Test Teardown    Fermer le navigateur

*** Test Cases ***
#Premier scénario fonctionel, virement interne valide
Virement interne valide
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Virements"
    Alors il est redirigé vers la page de virements
    Quand il sélectionne Livret A dans le menu déroulant du compte créditeur
    Et il qu'il rentre "1000" dans le champ montant
    Et qu'il rentre comme motif "Virement test"
    Et il clique sur le bouton "Effectuer le virement"
    Et qu'il clique sur l'onglet "Mes comptes"
    Alors le solde du compte courant est mis à jour avec un montant de "4 000,00€"
    Et le virement est affiché dans l'historique des transactions du compte avec le motif "Virement test" et le montant de "-1 000,00 €"

#Deuxième scénario fonctionel, virement externe avec un montant supérieur au solde du compte
Virement externe avec solde insuffisant
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Virements"
    Alors il est redirigé vers la page de virements
    Quand il sélectionne le bouton pour effectuer un virement "Vers un tiers"
    Et il sélectionne le livret A dans le menu déroulant du compte débiteur
    Et il choisit le compte de "Marc Bernard" en bénéficiaire
    Et il qu'il rentre "100000" dans le champ montant
    Et il clique sur le bouton "Effectuer le virement"
    Alors un message d'erreur "Solde insuffisant pour effectuer ce virement" est affiché

#Troisième scénario fonctionnel, virement externe avec un bénéficiaire non enregistré
Virement externe avec ajout d'un bénéficiaire
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Virements"
    Alors il est redirigé vers la page de virements
    Quand il sélectionne le bouton pour effectuer un virement "Vers un tiers"
    Et il clique sur le bouton "Ajouter un bénéficiaire"
    Alors il est redirigé vers la page d'ajout de bénéficiaire
    Quand il rentre "Sophie Dupont" dans le champ nom du bénéficiaire
    Et il rentre "FR7612345678901234567890123" dans le champ IBAN du bénéficiaire
    Et il clique sur le bouton "Ajouter"
    Alors le bénéficiaire "Sophie Dupont" est ajouté à la liste des bénéficiaires enregistrés
    Et il choisit le compte de "Sophie Dupont" en bénéficiaire
    Et il qu'il rentre "500" dans le champ montant
    Et qu'il rentre comme motif "Virement test bénéficiaire non enregistré"
    Et il clique sur le bouton "Effectuer le virement"
    Et qu'il clique sur l'onglet "Mes comptes"
    Alors le solde du compte courant est mis à jour avec un montant de "4 500,00€"
    Et le virement est affiché dans l'historique des transactions du compte avec le motif "Virement test bénéficiaire non enregistré" et le montant de "-500,00 €"

#Quatrième scénario non fonctionnel, vérification de la classe du message d'erreur pour un virement avec solde insuffisant
Virement avec solde insuffisant - Vérification de la classe du message d'erreur
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Virements"
    Alors il est redirigé vers la page de virements
    Quand il sélectionne Livret A dans le menu déroulant du compte créditeur
    Et il qu'il rentre "10000" dans le champ montant
    Et il clique sur le bouton "Effectuer le virement"
    Alors un message d'erreur "Solde insuffisant pour effectuer ce virement" est affiché
    Et le message d'erreur à la classe "error"

