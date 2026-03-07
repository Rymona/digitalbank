# Test suite contenant les scénarios métiers liés aux paiements de factures

*** Settings ***
# Importer les définitions de pas spécifiques aux authentifications
Resource    ../ressources/browser.resource
Resource    ../step_defs/step_authentification.resource
Resource    ../step_defs/step_paiementFacture.resource
Resource    ../step_defs/step_virements.resource

#  s'exécute avant chaque test de cette suite, lance le keyword pour ouvrir le navigateur
Test Setup    Ouvrir le navigateur
#  s'exécute après chaque test de cette suite, ferme le navigateur
Test Teardown    Fermer le navigateur

*** Test Cases ***
#Premier scénario fonctionel, paiement de la plus ancienne facture
Paiement de la plus ancienne facture
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Factures"
    Alors il est redirigé vers la page de factures
    Quand il clique sur le bouton "Payer" de la facture la plus ancienne d'un montant de "156,78€"
    Alors une fenêtre de confirmation de paiement s'affiche
    Quand il confirme le paiement
    Alors la facture passe dans la liste des factures payées

#Deuxième scénario fonctionel, paiement de la plus ancienne facture avec une anomalie de mise à jour du solde du compte
Paiement de la plus ancienne facture - avec anomalie de mise à jour du solde
    Etant donné que l'utilisateur est sur la page de connexion
    Se connecter avec "test@digitalbank.fr" et "Test1234!"
    Alors il est redirigé vers la page d'accueil
    Quand il clique sur le bouton "Factures"
    Alors il est redirigé vers la page de factures
    Quand il clique sur le bouton "Payer" de la facture la plus ancienne d'un montant de "156,78€"
    Alors une fenêtre de confirmation de paiement s'affiche
    Quand il confirme le paiement
    Alors la facture passe dans la liste des factures payées
    Et qu'il clique sur l'onglet "Mes comptes"
    Alors le solde du compte courant est mis à jour avec un montant de "4 843,22€"