*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    http://localhost:8000

*** Keywords ***
Ouvrir le navigateur
    ${options}=    Evaluate    (lambda o: (o.add_argument("--headless=new"), o.add_argument("--no-sandbox"), o.add_argument("--disable-dev-shm-usage"), o.add_argument("--window-size=1920,1080"), o)[-1])(sys.modules["selenium.webdriver"].ChromeOptions())    sys, selenium.webdriver
    Create Webdriver    Chrome    options=${options}
    Go To    ${BASE_URL}

Fermer le navigateur
    Close Browser