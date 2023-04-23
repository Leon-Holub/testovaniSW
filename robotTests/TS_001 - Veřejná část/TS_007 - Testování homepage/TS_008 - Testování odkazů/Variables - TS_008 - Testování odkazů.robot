*** Variables ***
${adresa-vyhledavace}  https://localhost/autobazarDrabek/vyhledavac-vozidel
${adresa-BMW}  https://localhost/autobazarDrabek/detail-vozu/1
${adresa-ig}  https://www.instagram.com/autobazar_drabek/

${selector-a-nabídkaNašichVozů}  //a[normalize-space()='Nabídka našich vozů']
${selector-a-nabídka}  //a[normalize-space()='Nabídka']
${selector-a-BMW}  //div[.//*[contains(text(),"BMW X4 Xdrive35D 230KWS")]]/ancestor::div[@class="swiper-slide card border-0 rounded-0 swiper-slide-active"]//a[contains(text(),"Více")]
${selector-a-instagram}  //i[@class="fa-brands fa-instagram"]/parent::a

${selector-section-tips}  //section[contains(@class, 'homepage-top-cars')]
