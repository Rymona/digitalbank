# Ce fichier définit les étapes pour les tests liés aux virements

*** Settings ***
# Importer les définitions des pages nécessaires
Resource    ../page_objects/page_connexion.resource
Resource    ../page_objects/page_accueil.resource
Resource    ../page_objects/page_virements.resource
Resource    ../page_objects/page_ajoutBeneficiaire.resource

*** Keywords ***
Quand il clique sur le bouton "Virements"
    Cliquer sur le bouton "Virements"

Alors il est redirigé vers la page de virements
    Je suis sur la page de virements

Quand il sélectionne Livret A dans le menu déroulant du compte créditeur
    Sélection livret A dans le menu déroulant du compte créditeur

Et il qu'il rentre "${montant}" dans le champ montant
    Rentrer un montant de virement    ${montant}

Et qu'il rentre comme motif "${motif}"
    Rentrer un motif de virement    ${motif}

Et il clique sur le bouton "Effectuer le virement"
    Appuyer sur le bouton "Effectuer le virement"

Et qu'il clique sur l'onglet "Mes comptes"
    Cliquer sur l'onglet "Mes comptes"

Alors le solde du compte courant est mis à jour avec un montant de "${montant_compte_courant}"
    Solde du compte courant    ${montant_compte_courant}

Et le virement est affiché dans l'historique des transactions du compte avec le motif "${motif}" et le montant de "${montant}"
    Virement affiché dans l'historique des transactions du compte    ${motif}    ${montant}

Quand il sélectionne le bouton pour effectuer un virement "Vers un tiers"
    Cliquer sur l'onglet virements externe

Et il sélectionne le livret A dans le menu déroulant du compte débiteur
    Sélectionner le livret A dans le menu déroulant du compte débiteur

Et il choisit le compte de "${nom_beneficiaire}" en bénéficiaire
    Choisir un compte bénéficiaire    ${nom_beneficiaire}

Alors un message d'erreur "Solde insuffisant pour effectuer ce virement" est affiché
    Vérification de l'affichage du message d'erreur lorsque le solde est insuffisant

Et il clique sur le bouton "Ajouter un bénéficiaire"
    Cliquer sur le bouton "Ajouter un bénéficiaire"

Alors il est redirigé vers la page d'ajout de bénéficiaire
    Je suis sur la page d'ajout de bénéficiaire

Quand il rentre "${nom_beneficiaire}" dans le champ nom du bénéficiaire
    Rentrer le nom du bénéficiaire    ${nom_beneficiaire}

Et il rentre "${iban_beneficiaire}" dans le champ IBAN du bénéficiaire
    Rentrer l'IBAN du bénéficiaire    ${iban_beneficiaire}

Et il clique sur le bouton "Ajouter"
    Cliquer sur le bouton "Ajouter"

Alors le bénéficiaire "${nom_beneficiaire}" est ajouté à la liste des bénéficiaires enregistrés
    Vérifier que le bénéficiaire a été ajouté à la liste des bénéficiaires enregistrés    ${nom_beneficiaire}

Et le message d'erreur à la classe "error"
    Vérification de la classe du message d'erreur pour un virement avec solde insuffisant