*** Settings ***
Library    SeleniumLibrary 
   
Default Tags    Regresyon Testing

*** Variables ***
${URL}       http://localhost:8383/DemoLogin/index.html
&{LOGINDATA}    username=admin    password=123456   

*** Keywords ***
LoginPageKeywords
    Input Text            id=kullaniciAdi  &{LOGINDATA}[username]
    Input Password        id=parola        &{LOGINDATA}[password]
    Click Button          id=btnGirisYap

*** Test Cases ***

CorrectLoginTest
    [Documentation]    Başarılı Oturum Açma Senaryosu
    Open Browser          ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginPageKeywords
    Close Browser
    Log    ${TEST NAME} başarıyla tamamlandı...  