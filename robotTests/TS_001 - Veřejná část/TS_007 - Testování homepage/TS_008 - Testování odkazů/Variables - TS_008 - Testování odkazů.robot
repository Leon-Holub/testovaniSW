*** Variables ***
${adresa-vyhledavace}  https://localhost/autobazarDrabek/vyhledavac-vozidel
${adresa-BMW}  https://localhost/autobazarDrabek/detail-vozu/1
${adresa-ig}  https://www.instagram.com/autobazar_drabek/
${adresa-mapy}  https://www.google.com/maps/place//data=!4m2!3m1!1s0x4713042aa111c49f:0x7586392a4b9e4f67?source=g.page.share
${adresa-portfolio}  https://www.leonholub.cz/portfolio/www/

${selector-a-nabídkaNašichVozů}  //a[normalize-space()='Nabídka našich vozů']
${selector-a-nabídka}  //a[normalize-space()='Nabídka']
${selector-a-BMW}  //div[.//*[contains(text(),"BMW X4 Xdrive35D 230KWS")]]/ancestor::div[@class="swiper-slide card border-0 rounded-0 swiper-slide-active"]//a[contains(text(),"Více")]
${selector-a-instagram}  //i[@class="fa-brands fa-instagram"]/parent::a
${selector-a-map}  //div[@class='contact-group']//a
${selector-a-portofilo}  ${selector-section-footerInfo}//a[normalize-space()='Leon Holub']

${selector-section-tips}  //section[contains(@class, 'homepage-top-cars')]
${selector-section-footer}  //section[@class="footer py-5"]
${selector-section-footerInfo}  //section[@class='footer-info']

