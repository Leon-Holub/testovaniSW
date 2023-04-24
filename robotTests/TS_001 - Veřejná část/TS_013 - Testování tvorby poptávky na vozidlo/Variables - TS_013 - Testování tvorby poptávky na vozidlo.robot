*** Variables ***
${adresaTvorbyPoptavky}  detail-vozu/32
${adresa-zruseniPoptávky}  poptavka/114/Leon-Holub

${selector-button-poptavka}  //button[contains(span, 'Nezávazná poptávka')]
${selector-button-send}  //input[@name='send']
${selector-button-zrušitPoptávku}  //a[contains(text(),'Zrušit poptávku')]

${selector-input-name}  //input[@id='frm-carRequestForm-name']
${selector-input-surname}  //input[@id='frm-carRequestForm-surname']
${selector-input-phone}  //input[@id='frm-carRequestForm-phone_number']
${selector-input-email}  //input[@id='frm-carRequestForm-email']
${selector-input-message}  //textarea[@id='frm-carRequestForm-message']

${selector-h5-name}  (//h5[@class='bg-white p-2 rounded'])[1]
${selector-h5-surname}  (//h5[@class='bg-white p-2 rounded'])[2]
${selector-h1-detailPoptávky}  //h1[contains(text(),"Detail poptávky")]

${selector-error-name}  //span[@id='frm-carRequestForm-name_message']
${selector-error-surname}  //span[@id='frm-carRequestForm-surname_message']
${selector-error-email}  //span[@id='frm-carRequestForm-email_message']
${selector-all-errors}  //*[@class="help-block text-danger"]

${message-error}  Toto pole je povinné.
${message-request-cancel}  Váš požadavek na výkup vozu byl úspěšně zrušen

${data-name}  Leon
${data-surname}  Holub
${data-phone}  123456789
${data-email}  l_holub@utb.cz
${data-message}  Dobrý den, rád bych Vás požádal o nezávaznou nabídku na vozidlo CPI OPAI ELEKTRO SCOOTER.
