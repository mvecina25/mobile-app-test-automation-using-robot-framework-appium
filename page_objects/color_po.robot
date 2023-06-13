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
    AppiumLibrary.Capture Page Screenshot    ../resources/color/actual-color.png 
    Compare Images    ../resources/color/expected-color.png    ../resources/color/actual-color.png    ../resources/color/masks-color.json