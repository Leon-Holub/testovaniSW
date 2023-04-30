*** Settings ***
Resource    ../../main-settings-variables-keywords.robot

*** Variables ***
${adresa-nazev}  https://localhost/autobazarDrabek/stranka/nazev
${adresa-prvniStranka}  https://localhost/autobazarDrabek/stranka/asfd
${adresa-portu}  https://www.portu.cz/ucet/prihlasit-se/
${adresa-seznam}  https://www.seznam.cz/

${selector-div-footer-odkazy}  //section[@class="footer py-5"]//h5[contains(text(),"Odkazy")]/following-sibling::div
${selector-div-mainNav}  //nav//div[@class="container main-nav--bottom pt-1"]

${selector-a-footer-nazev}  ${selector-div-footer-odkazy}/a[contains(text(),"Název")]
${selector-a-footer-portu}  ${selector-div-footer-odkazy}/a[contains(text(),"Portu")]
${selector-a-header-prvniStranka}  ${selector-div-mainNav}//a[@class="nav-link" and normalize-space()='První stránka']
${selector-a-header-seznam}  ${selector-div-mainNav}//a[@class="nav-link" and normalize-space()='Seznam']
