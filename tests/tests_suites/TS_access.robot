*** Settings ***
# importe la bibliothèque SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
# URL de base de l'application
${BASE_URL}    http://localhost:8000

*** Test Cases ***
# Test de base pour vérifier que l'application est accessible
Vérifier que la page de connexion est accessible
    Open Browser    ${BASE_URL}    chrome
    Page Should Contain Element    xpath=//*[@data-testid="btn-login"]
    Close Browser