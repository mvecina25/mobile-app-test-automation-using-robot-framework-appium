*** Settings ***
Documentation    Suite description

Library     AppiumLibrary    timeout=30
Library     DocTest.VisualTest

*** Variables ***
&{text_elements}    
...    text_button=com.lambdatest.proverbial:id/Text
...    text_value=com.lambdatest.proverbial:id/Textbox

*** Keywords ***
Click Text Button
    AppiumLibrary.Wait Until Page Contains Element    ${text_elements.text_button}
    AppiumLibrary.Click Element    ${text_elements.text_button}
    
Verify Text Value
    AppiumLibrary.Wait Until Page Contains Element    ${text_elements.text_value}
    AppiumLibrary.Element Should Contain Text    ${text_elements.text_value}    Proverbial