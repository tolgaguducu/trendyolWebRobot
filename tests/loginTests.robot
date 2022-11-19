*** Settings ***

Resource  ../sources/steps.robot

Force Tags  @trendyolWeb  @LOGIN
Documentation  Trendyol Login Test Scenarios

Test Setup  Setup Chrome Driver And Maximize
Test Teardown  Close All Driver


*** Test Cases ***

Successful Login on Trendyol
    Element Visible And Click  ${HOME_modalClose_button}
    Element Visible And Click  ${NAVBAR_login_button}
    Element Visible And Input Text  ${LOGIN_emailInput_textBox}  trendyolr@doitups.com
    Element Visible And Input Text  ${LOGIN_passwordInput_textBox}  Trendyol123.
    Element Visible And Click  ${LOGIN_formLogin_button}
    sleep  5