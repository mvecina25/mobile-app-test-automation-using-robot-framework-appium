*** Settings ***
Documentation    Suite description

Library     AppiumLibrary    timeout=30
Library     DocTest.VisualTest

*** Variables ***
&{speed_elements}    
...    speed_button=com.lambdatest.proverbial:id/speedTest
...    go_button=com.lambdatest.proverbial:id/webbrowser
...    reference=//android.view.View[@content-desc="SPEEDTEST®"]/android.widget.TextView
...    test_again=//android.view.View[@content-desc="Test Again"]/android.widget.TextView
...    home_button=accessibility_id=Home

*** Keywords ***
Click Speed Test Button
    AppiumLibrary.Wait Until Element Is Visible    ${speed_elements.speed_button}
    AppiumLibrary.Click Element    ${speed_elements.speed_button}

Click Go Button
    AppiumLibrary.Click Element    ${speed_elements.go_button}

Capture Speed Test
    FOR    ${index}    IN RANGE    10
        ${present}=  Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible    ${speed_elements.test_again}
        Log To Console    Speed Test is still on going. Status:${present}
        Sleep    5
        IF    '${present}' == 'False'    CONTINUE
        AppiumLibrary.Capture Page Screenshot    ${CURDIR}/../resources/speed/speedtest.png
        AppiumLibrary.Click Element    ${speed_elements.home_button}
        Exit For Loop
    END