*** Settings ***

Resource  ../sources/other.robot
Resource  ../sources/steps.robot
Resource  ../sources/variables.robot


*** Keywords ***

Go to login page and fill the login form
    [Arguments]  ${email}  ${password}
    Element Visible And Click  ${NAVBAR_login_button}
    Element Visible And Input Text  ${LOGIN_emailInput_textBox}  ${email}
    Element Visible And Input Text  ${LOGIN_passwordInput_textBox}  ${password}
    Element Visible And Click  ${LOGIN_formLogin_button}