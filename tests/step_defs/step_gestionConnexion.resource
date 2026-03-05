# Ce fichier définit les étapes pour les tests liés à la gestion de connexion

*** Settings ***
# Importer les définitions des pages nécessaires
Resource    ../page_objects/page_connexion.resource
Resource    ../page_objects/page_accueil.resource
Resource    ../page_objects/page_connexion_2fa.resource
Resource    ../page_objects/page_securite.resource
Resource    ../page_objects/page_modificationMDP.resource

*** Keywords ***
Quand il clique sur le bouton "Sécurité"
    Cliquer sur le bouton "Sécurité"

Alors il est redirigé vers la page de paramètres de sécurité
    Je suis sur la page sécurité

Quand il clique sur le bouton "Modifier le mot de passe"
    Cliquer sur le bouton "Modifier le mot de passe"

Alors il est redirigé vers la page de modification du mot de passe
    Je suis sur la page de modification du mot de passe

Quand il saisit "${mot_de_passe_actuel}" dans le champ mot de passe actuel
    Je saisie le mot de passe actuel    ${mot_de_passe_actuel}

Et il saisit "${nouveau_mot_de_passe}" dans le champ nouveau mot de passe
    Je saisie le nouveau mot de passe    ${nouveau_mot_de_passe}

Et il saisit "${nouveau_mot_de_passe}" dans le champ confirmation du nouveau mot de passe
    Je saisie la confirmation du nouveau mot de passe    ${nouveau_mot_de_passe}

Et il clique sur le bouton "Enregistrer"
    Cliquer sur le bouton "Enregistrer"

Alors un message de confirmation "Mot de passe modifié avec succès" est affiché
    Le message de confirmation "Mot de passe modifié avec succès" est affiché

Quand il se déconnecte de son compte
    Je clique sur le bouton de déconnexion

Alors il est redirigé vers la page de connexion
    Je suis sur la page de connexion

Quand il clique sur le bouton "Désactiver 2FA"
    Cliquer sur le bouton Activation/Désactivation 2FA

Alors un message de confirmation "Double authentification désactivéé" est affiché
    Affichage du message de confirmation "Double authentification désactivéé"

Et le message de confirmation est accessible et visible
# Vérifier que le message a un label associé pour l'accessibilité
    Label associé au message de confirmation "changement de mot de passe" est accessible et visible

Et le champ de saisie du mot de passe actuel est de type "password"
    Le champ de mot de passe actuel est de type "password"

Et le champ de saisie du nouveau mot de passe est de type "password"
    Le champ de nouveau mot de passe est de type "password"

Et le champ de saisie de la confirmation du nouveau mot de passe est de type "password"
    Le champ de confirmation du nouveau mot de passe est de type "password"