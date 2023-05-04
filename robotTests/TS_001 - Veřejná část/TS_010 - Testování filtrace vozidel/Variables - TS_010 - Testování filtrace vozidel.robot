*** Settings ***
Resource    ../../main-settings-variables-keywords.robot

*** Variables ***
${adresa-vyhledavacVozidel}  vyhledavac-vozidel

${selector-section-foundCars}  //section[@class="carsList-foundCars mt-1 pt-3 pb-5"]

${selector-div-carCard}  ${selector-section-foundCars}//div[@class="col-12 col-sm-6 col-md-4 col-lg-3 card border-0 rounded-0 my-3"]

${selector-div-customSelect-druhVozidla}  //label[normalize-space()='Druh vozidla']/following-sibling::div[@class="custom-select"]
${selector-div-customSelect-druhZnacka}  //label[normalize-space()='Značka']/following-sibling::div[@class="custom-select"]
${selector-div-customSelect-karoserie}  //label[normalize-space()='Karoserie']/following-sibling::div[@class="custom-select"]
${selector-div-customSelect-model}  //label[normalize-space()='Model']/following-sibling::div[@class="custom-select"]
${selector-div-customSelect-typPaliva}  //label[normalize-space()='Typ paliva']/following-sibling::div[@class="custom-select"]
${selector-div-customSelect-typPrevodovky}  //label[normalize-space()='Typ převodovky']/following-sibling::div[@class="custom-select"]

${selector-div-customSelect-panel}  //div[@class="custom-select-panel"]

${selector-div-customSelect-option-osobníVůz}  Osobní vůz
${selector-div-customSelect-option-znacka-BMW}  BMW
${selector-div-customSelect-option-znacka-Volvo}  Volvo
${selector-div-customSelect-option-znacka-Opel}  Opel
${selector-div-customSelect-option-karoserie-combi}  Combi
${selector-div-customSelect-option-model-xc90}  XC 90
${selector-div-customSelect-option-palivo-diesel}  Diesel
${selector-div-customSelect-option-prevodovka-manual}  Manuál

${selector-h3-carNotFound}  //h3[contains(text(),'Nebylo nalezeno vozidlo odpovídající Vašim požadavkům')]

${selector-checkbox-4x4}  //input[@id='frm-carsFilterForm-four_x_four']

${count-osobníVůz}  4
${count-brand-Opel}  1
${count-4x4}  2
${count-fullInputs}  1
${count-carNotFound}  0


*** Keywords ***
Set Value on Custom Select
    [Arguments]    ${selector-customSelect}  ${selector-option}
    Wait And Click    ${selector-customSelect}
    Wait Until Element Is Visible  ${selector-customSelect}${selector-div-customSelect-panel}
    Element Should Be Visible    ${selector-customSelect}${selector-div-customSelect-panel}
    Set Focus And Wait  ${selector-customSelect}//div[normalize-space()='${selector-option}' and @class="custom-select-option"]
    Wait And Click    ${selector-customSelect}//div[normalize-space()='${selector-option}' and @class="custom-select-option"]
    Wait Until Element Is Not Visible    ${selector-customSelect}${selector-div-customSelect-panel}
    Element Should Not Be Visible    ${selector-customSelect}${selector-div-customSelect-panel}