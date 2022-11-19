*** Settings ***

Resource  ../sources/other.robot

*** Variables ***

${chrome_browser}   Chrome
${base_url}  https://trendyol.com/


*** Keywords ***

Setup Chrome Driver And Maximize
    ${chrome_driver}=  get chrome driver
    create webdriver  ${chrome_browser}  executable_path=${chrome_driver}
    go to  ${base_url}
    maximize browser window

Close All Driver
    close all browsers