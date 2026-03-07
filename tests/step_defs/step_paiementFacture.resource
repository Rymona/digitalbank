# Ce fichier définit les étapes pour les tests liés aux paiements de factures

*** Settings ***
# Importer les définitions des pages nécessaires
Resource    ../page_objects/page_connexion.resource
Resource    ../page_objects/page_accueil.resource
Resource    ../page_objects/page_facture.resource
Resource    ../page_objects/page_confirmationFacture.resource

*** Keywords ***
Quand il clique sur le bouton "Factures"
    Cliquer sur le bouton "Factures"

Alors il est redirigé vers la page de factures
    La page de factures est affichée

Quand il clique sur le bouton "Payer" de la facture la plus ancienne d'un montant de "156,78€"
    Cliquer sur la facture la plus ancienne

Alors une fenêtre de confirmation de paiement s'affiche
    La page de confirmation de facture est affichée

Quand il confirme le paiement
    Cliquer sur confirmer le paiement

Alors la facture passe dans la liste des factures payées
    La facture la plus ancienne est passée dans la liste des factures payées