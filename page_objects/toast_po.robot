*** Settings ***
Documentation    Suite description

Library     AppiumLibrary    timeout=30
Library     DocTest.VisualTest

*** Variables ***
&{toast_elements}    
...    toast_button=com.lambdatest.proverbial:id/toast

*** Keywords ***
Click Toast Button
    AppiumLibrary.Wait Until Element Is Visible    ${toast_elements.toast_button}
    AppiumLibrary.Click Element    ${toast_elements.toast_button}

Verify Toast Value
    AppiumLibrary.Capture Page Screenshot    ${CURDIR}/../resources/toast/actual-toast.png
    Compare Images    ${CURDIR}/../resources/toast/expected-toast.png    ${CURDIR}/../resources/toast/actual-toast.png    ${CURDIR}/../resources/toast/masks-toast.json