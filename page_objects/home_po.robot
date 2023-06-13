*** Settings ***
Documentation    Suite description

Library     AppiumLibrary    timeout=30
Library     DocTest.VisualTest

*** Variables ***
&{home_elements}    
...    home_button=accessibility_id=Home

*** Keywords ***
Click Home Button
    AppiumLibrary.Wait Until Element Is Visible    ${home_elements.home_button}
    AppiumLibrary.Click Element    ${home_elements.home_button}
