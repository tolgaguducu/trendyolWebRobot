*** Settings ***

Resource  ../sources/steps.robot

Force Tags  @trendyolWeb  @LOGIN
Documentation  Trendyol Login Test Scenarios

Test Setup  Setup Chrome Driver And Maximize
Test Teardown  Close All Driver


*** Test Cases ***

Successful Login on Trendyol
    Element Visible And Click  ${HOME_modalClose_button}