*** Settings ***

Resource  ../sources/steps.robot

Force Tags  @trendyolWeb  @LOGIN
Documentation  Trendyol Login Test Scenarios

Test Setup  Setup Chrome Driver And Maximize
Test Teardown  Close All Driver


*** Test Cases ***

Search a product and add to favorite on search results page
    Element Visible And Click  ${HOME_modalClose_button}
    Go to login page and fill the login form  trendyolr@doitups.com  Trendyol123.
    sleep  1
    Element Visible And Click  ${HOME_searchInput_textBox}
    input text  ${HOME_searchInput_textBox}  Playstation 5
    Element Visible And Click  ${HOME_searchIcon_button}
    Element Visible And Click  ${SEARCH_firstProductFavorite_button}
    sleep  5
