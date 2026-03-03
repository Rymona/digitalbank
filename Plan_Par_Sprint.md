# Plan des Sprints – DigitalBank

Ce document présente la feuille de route des développements d’automatisation des tests par sprint

-----------------------------------------------------------------------
# Sprint 1 – Authentification et Socle
## Objectif
Sécuriser l’accès à l’application et stabiliser l’architecture d’automatisation.

## Tests fonctionnels
- Connexion valide sans 2FA
- Connexion valide avec 2FA
- Connexion invalide (mot de passe incorrect)

## Accessibilité (WCAG)
- Vérification de la présence de labels associés aux champs email et mot de passe.

## Éco-conception
- Vérification qu’un clic sur “Connexion” ne provoque pas un rechargement complet inutile de la page.

-----------------------------------------------------------------------
## Sprint 2 – Sécurité et Mot de passe
## Objectif
Couvrir le scénario critique de modification de mot de passe.

## Tests fonctionnels
- Modification du mot de passe
- Connexion avec le nouveau mot de passe
- Activation / désactivation de la double authentification

## Accessibilité
- Vérification que le message de confirmation de modification est visible et lisible.

## Éco-conception
- Vérification que seule la section concernée est mise à jour après modification.

-----------------------------------------------------------------------
# Sprint 3 – Virements et Bénéficiaires
## Objectif
Sécuriser les opérations financières.

## Tests fonctionnels
- Virement interne valide
- Virement refusé (solde insuffisant)
- Ajout d’un bénéficiaire et virement vers bénéficiaire

## Accessibilité
- Vérification que le message d’erreur “solde insuffisant” est visible et ne repose pas uniquement sur la couleur.

## Éco-conception
- Vérification que le solde est mis à jour dynamiquement sans rechargement complet.

-----------------------------------------------------------------------
# Sprint 4 – Paiement et Pipeline CI/CD
## Objectif
Finaliser la couverture fonctionnelle et industrialiser l’exécution.

## Tests fonctionnels
- Paiement de facture valide

## Accessibilité
- Vérification que le message de confirmation de paiement est visible.

## Éco-conception
- Vérification qu’il n’y a pas de double soumission du formulaire.

# Pipeline CI/CD
- Mise en place du pipeline GitHub Actions
- Exécution automatique des tests sur push vers la branche main
- Publication des rapports