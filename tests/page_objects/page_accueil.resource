*** Settings ***
# Importer la library SeleniumLibrary
Library    SeleniumLibrary


*** Keywords ***
Je suis sur la page d'accueil
    # Vérifier que l'utilisateur est bien sur la page d'accueil après une connexion réussie
    Wait Until Page Contains Element    xpath=//*[@id="btn-logout"]    timeout=10s

Cliquer sur le bouton "Sécurité"
    Scroll Element Into View    xpath=//button[@data-testid="tab-security"]
    Click Button    xpath=//button[@data-testid="tab-security"]

Solde du compte courant
    [Arguments]    ${montant_compte_courant}
    ${balance}=    Get Text    xpath=//div[@data-testid="balance-4"]
    Should contain    ${balance}    ${montant_compte_courant}

Virement affiché dans l'historique des transactions du compte
    [Arguments]    ${motif}    ${montant}
    Element Should Be Visible    xpath=//span[@class="transaction-description" and text()="${motif}"]
    ${amount_text}=    Get Text    xpath=//span[contains(@class,"transaction-amount")]
    Should Contain    ${amount_text}    ${montant}