*** Settings ***
Resource    ../Variables - TS_002 - Administrační část.robot

*** Variables ***
${adresa-poptavky}  ${homeURL}Cars/Requests

${selector-a-showRequest}  //tr[@id='snippet-carRequestsGrid-item-114']//a[@title='Zobrazit']
${selector-a-select-acceptRequest}  //ul[@class='dropdown-menu show']//a[@class='ajax dropdown-item'][contains(text(),'Přijat')]
${selector-a-denyRequest}  //tr[@id='snippet-carRequestsGrid-item-114']//a[@title='Zamítnout']
${selector-a-nastenka}  //span[contains(text(),"Nástěnka")]/parent::a

${selector-button-showStatesSelect}  //tr[@id='snippet-carRequestsGrid-item-114']//button[@type='button'][normalize-space()='Nový']
${selector-button-showStatesSelect-success}  //tr[@id='snippet-carRequestsGrid-item-114']//button[@type='button'][normalize-space()='Přijat']
${selector-button-showStatesSelect-danger}  //tr[@id='snippet-carRequestsGrid-item-114']//button[@type='button'][normalize-space()='Zamítnut']

${selector-select-actions}  //select[@id='frm-carRequestsGrid-filter-group_action-group_action']

${selector-submit-action}  //input[@id='carrequestsgridgroup_action_submit']

${selector-input-checkbox-114}  //tr[@id="snippet-carRequestsGrid-item-114"]//input[@type="checkbox"]
${selector-input-checkbox-101}  //tr[@id="snippet-carRequestsGrid-item-101"]//input[@type="checkbox"]
${selector-input-checkbox-102}  //tr[@id="snippet-carRequestsGrid-item-102"]//input[@type="checkbox"]

${select-span-requestsCount}  //span[@id='snippet--requestCountSnippet']

${selector-div-modal-request}  //div[@class="modal fade modal-lg show"]

${selector-th-RequestCount}  //td[contains(text(),'Počet nevyřízených poptávek vozidel')]/following-sibling::th

${data-action}  Přijmout