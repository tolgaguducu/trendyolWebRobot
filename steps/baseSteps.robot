*** Settings ***

Resource  ../sources/other.robot
Resource  ../sources/steps.robot
Resource  ../sources/variables.robot


*** Keywords ***

Wait Until Element Is Visible With Timeout
    [Arguments]  ${locatorElement}
    wait until element is visible  ${locatorElement}  timeout=30
    scroll element into view  ${locatorElement}


Element Visible And Click
    [Arguments]  ${locatorElement}
    Wait Until Element Is Visible With Timeout  ${locatorElement}
    click element  ${locatorElement}


If Element Visible And Click
    [Arguments]  ${locatorElement}
    sleep  5
    ${count}=  get element count  ${locatorElement}
    run keyword if   ${count} > 0  click element  ${locatorElement}


If Element Visible And Input Text
    [Arguments]  ${locatorElement}  ${inputText}
    sleep  5
    ${count}=  get element count  ${locatorElement}
    run keyword if   ${count} > 0  input text  ${locatorElement}  ${inputText}


Element Visible And Hover
    [Arguments]  ${locatorElement}
    Wait Until Element Is Visible With Timeout  ${locatorElement}
    mouse over  ${locatorElement}
    sleep  1


If Element Visible And Select Frame
    [Arguments]  ${locatorElement}  ${iframe}
    sleep  5
    ${count}=  get element count  ${locatorElement}
    run keyword if   ${count} > 0  select frame  ${iframe}


Element Visible And Input Text
    [Arguments]  ${locatorElement}  ${inputText}
    Wait Until Element Is Visible With Timeout  ${locatorElement}
    input text  ${locatorElement}  ${inputText}


Click Element And Check Url
    [Arguments]  ${locatorElement}  ${checkLink}
    Element Visible And Click  ${locatorElement}
    location should be  ${checkLink}


Opening Link And Visible Element With Check Url
    [Arguments]  ${link}  ${locatorElement}  ${checkLink}
    go to  ${link}
    Wait Until Element Is Visible With Timeout  ${locatorElement}
    location should be  ${checkLink}


Opening Link And Check Element Text With Check Url
    [Arguments]  ${link}  ${locatorElement}  ${checkText}  ${checkLink}
    go to  ${link}
    element text should be  ${locatorElement}  ${checkText}
    location should be  ${checkLink}


Click Element With Switch Window And Check Url
    [Arguments]  ${locatorElement}  ${selectWindow}  ${checkLink}
    Element Visible And Click  ${locatorElement}
    switch window  ${selectWindow}
    location should be  ${checkLink}


Element Visible And Check Url
    [Arguments]  ${locatorElement}  ${action}  ${checkLink}
    Wait Until Element Is Visible With Timeout  ${locatorElement}
    ${result}=   set variable   ${action}
    run keyword if   "${result}" == "Contain"  location should contain  ${checkLink}
...   ELSE  location should be  ${checkLink}


Check Element Text
    [Arguments]  ${locatorElement}  ${action}  ${text}
    Wait Until Element Is Visible With Timeout  ${locatorElement}
    ${result}=   set variable   ${action}
    run keyword if   "${result}" == "Contain"  element should contain  ${locatorElement}  ${text}
    run keyword if   "${result}" == "Equal"  element text should be  ${locatorElement}  ${text}


Check Element Size
    [Arguments]  ${locatorElement}  ${action}  ${checkCount}
    sleep  3
    ${count}=  get element count  ${locatorElement}
    ${result}=   set variable   ${action}
    run keyword if   "${result}" == "Greater than"  should be true  ${count} >= ${checkCount}
    run keyword if   "${result}" == "Less than"  should be true  ${count} <= ${checkCount}
    run keyword if   "${result}" == "Equal to"  should be equal as integers  ${count}  ${checkCount}