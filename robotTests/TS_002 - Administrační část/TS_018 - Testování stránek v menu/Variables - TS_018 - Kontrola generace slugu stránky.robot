*** Settings ***
Resource    ../Variables - TS_002 - Administrační část.robot

*** Variables ***
${adresa-navigation}  ${homeURL}Navigation
${adresa-navigation-pageAdd}  ${homeURL}Page/Add
${adresa-navigation-page-dlouhyNazev}  ${homeURL}stranka/${data-check-nameToSlug}
${adresa-navigation-bottom}  ${adresa-navigation}/Bottom

${selector-a-addPage}  //a[@href='/autobazarDrabek/Page/Add']
${selector-a-showPage}  //td[normalize-space()='${data-check-nameToSlug}']/parent::tr//a[@class="btn btn-info mx-1"]
${selector-a-showPage-outside}  //td[normalize-space()='${data-name-TP_051}']/parent::tr//a[@class="btn btn-info mx-1"]
${selector-a-dolniMenu}  //span[contains(text(),"Spodní menu")]/parent::a

${selector-span-error-slug}  //span[@id='frm-pageForm-slug_message']

${selector-label-typeOdkaz}  //label[@for='frm-pageForm-type-1']

${selector-input-name}  //input[@id='frm-pageForm-name']
${selector-input-slug}  //input[@id='frm-pageForm-slug']
${selector-input-link}  //input[@id='frm-pageForm-link']
${selector-input-select-position}  //select[@id='frm-pageForm-nav_position']
${selector-input-select-state}  //select[@id='frm-pageForm-state']
${selector-input-changePosition-DlouhýNázev}  //input[@type='number']
${selector-input-submit}  //input[@name='save']

${selector-input-tinyMCE}  //iframe[@id='frm-pageForm-content_ifr']

${selector-td-position-FAI}  //td[contains(text(),"${data-name-TP_051}")]/parent::tr//td[@class="text-right col-position"]
${selector-td-position-DlouhýNázev}  //td[contains(text(),"${data-check-nameToSlug}")]/parent::tr//td[@class="text-right col-position"]

${data-name}  Dlouhý název
${data-pageContent}  "Lorem ipsum Dolorot ahmed ..."
${data-name-TP_051}  FAI
${data-pageLink}  https://fai.utb.cz/
${data-positionBottom}  Spodní
${data-statePublic}  Publikováno

${data-check-nameToSlug}  Dlouhy-nazev
${data-check-error-slug}  Slug se může skládat pouze z písmen anglické abecedy, čísel a pomlčky


*** Keywords ***
Input TinyMCE Text
    [Arguments]    ${selector}  ${text}
    Select Frame    ${selector}
    Execute Javascript    document.querySelector('body').innerHTML = ${text}
    Unselect Frame
