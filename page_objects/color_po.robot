*** Settings ***
Documentation    Suite description

Library     AppiumLibrary    timeout=30
Library     DocTest.VisualTest

*** Variables ***
&{color_elements}    
...    color_button=com.lambdatest.proverbial:id/color

*** Keywords ***
Click Color Button
    AppiumLibrary.Wait Until Element Is Visible    ${color_elements.color_button}
    AppiumLibrary.Click Element    ${color_elements.color_button}

Verify Color Change
    AppiumLibrary.Capture Page Screenshot    ${CURDIR}/../resources/color/actual-color.png 
    Compare Images    ${CURDIR}/../resources/color/expected-color.png    ${CURDIR}/../resources/color/actual-color.png    ${CURDIR}/../resources/color/masks-color.json