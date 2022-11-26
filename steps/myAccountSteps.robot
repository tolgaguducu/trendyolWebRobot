*** Settings ***

Resource  ../sources/other.robot
Resource  ../sources/steps.robot
Resource  ../sources/variables.robot


*** Keywords ***

Go to my user info on my account page
    Element Visible And Click  ${NAVBAR_myAccount_button}
    Element Visible And Click  ${MYACCOUNT_myUserInfo_button}


