*** Settings ***

Resource  ../sources/steps.robot

Force Tags  @trendyolWeb  @LOGIN
Documentation  Trendyol Login Test Scenarios

Test Setup  Setup Chrome Driver And Maximize
Test Teardown  Close All Driver


*** Test Cases ***

Unsuccessful login attempt with email and password error messages
    [Tags]  @TRWEB-1
    Element Visible And Click  ${HOME_modalClose_button}
    Element Visible And Click  ${NAVBAR_login_button}
    Element Visible And Click  ${LOGIN_formLogin_button}
    Check Element Text  ${LOGIN_formErrorMessage_text}  Equal  Lütfen geçerli bir e-posta adresi giriniz.
    Element Visible And Input Text  ${LOGIN_emailInput_textBox}  wilogif182@covbase.com
    Element Visible And Click  ${LOGIN_formLogin_button}
    Check Element Text  ${LOGIN_formErrorMessage_text}  Equal  Lütfen şifrenizi giriniz.


Successful login
    [Tags]  @TRWEB-2
    Element Visible And Click  ${HOME_modalClose_button}
    Go to login page and fill the login form  wilogif182@covbase.com  Trendyol123.
    sleep  2
    Go to my user info on my account page
    sleep  2
    Element Visible And Attribute Should Be  ${MYACCOUNT_myUserInfo_email_value}  value  wilogif182@covbase.com