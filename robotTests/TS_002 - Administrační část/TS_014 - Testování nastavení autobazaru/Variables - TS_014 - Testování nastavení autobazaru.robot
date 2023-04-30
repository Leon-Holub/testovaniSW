*** Settings ***
Resource    ../Variables - TS_002 - Administrační část.robot

*** Variables ***
${adresa-settings}  ${homeURL}Settings
${adresa-texty}  ${homeURL}Homepage/Texts


${selector-tinyMCE-settings}  //iframe[@id="frm-settingsForm-news_ifr"]
${selector-input-absolute-submit}  //input[@type="submit" and @class="btn btn-primary position-fixed bottom-0 end-0 m-2"]
${selector-input-holiday}  //input[@id='frm-settingsForm-closedFrom']
${selector-input-textArea-addText}  //textarea[@id='frm-homepageGrid-filter-inline_add-text']
${selector-input-textArea-editText}  //textarea[@id='frm-homepageGrid-filter-inline_edit-text']
${selector-input-submit-addText}  //input[@class="btn btn-xs btn-primary" and @value="Uložit"]

${selector-section-homepageNews}  //section[@class="homepage-news my-5 bg-white"]
${selector-section-offers}  //section[@class="homepage-offers mt-5"]

${selector-h5-offer-addedText}  (//section[@class="homepage-offers mt-5"]//h5)[last()]

${selector-p-homepageNews}  ${selector-section-homepageNews}//div[@class="card-text"]/p
${selector-a-openState}  //div[@class="container-fluid main-nav--top"]//a[@href="/autobazarDrabek/default/contact"]
${selector-contact-time-9-17}  //td[contains(text(),'9:00 - 17:00')]
${selector-div-contact-alert}  //div[@class='alert alert-danger text-center']

${selector-a-addText}  //a[@title='Přidat']
${selector-a-editText}  //td[contains(text(),"${data-addText-text}")]/parent::tr//a[@title='Upravit']
${selector-a-deleteText}   //td[contains(text(),"${data-editText-text}")]/parent::tr//a[@title='Smazat']

${selector-tr-textRow}  //tr[@id="snippet-homepageGrid-item-96"]

${data-tinyMCe-empty}  ""
${data-tinyMCe-Text}  "#News – nějaké místo na novinky – například tam budu potřebovat psát dovolenou… nějaká omezení, novinky (nový vozík na půjčení , možná i dodávku budeme mít na půjčení atp) atp.,…"
${data-settings-openHours}  9:00 - 17:00
${data-settings-holiday}  30.4.2023
${data-addText-text}  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
${data-editText-text}  	Nový text

${check-text-opened}  Otevřeno ${data-settings-openHours}
${check-text-closed}  Zavřeno
${check-text-holiday}  ${data-settings-holiday} - zavřeno
${check-data-contact-ocurrences}  7

*** Keywords ***
Input TinyMCE Text
    [Arguments]    ${selector}  ${text}
    Select Frame    ${selector}
    Execute Javascript    document.querySelector('body').innerHTML = ${text}
    Unselect Frame