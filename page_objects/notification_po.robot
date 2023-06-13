*** Settings ***
Documentation    Suite description

Library     AppiumLibrary    timeout=30
Library     DocTest.VisualTest

*** Variables ***
&{notif_elements}    
...    notif_button=com.lambdatest.proverbial:id/notification
...    notif_clear=accessibility_id=Clear all notifications.
...    notif_allow=com.android.permissioncontroller:id/permission_allow_button
...    notif_dont_allow=com.android.permissioncontroller:id/permission_deny_button
...    notif_message=android:id/text

*** Keywords ***
Click Notification Button
    AppiumLibrary.Wait Until Element Is Visible    ${notif_elements.notif_button}
    AppiumLibrary.Click Element    ${notif_elements.notif_button}
    
Click Allow Notification
    AppiumLibrary.Wait Until Element Is Visible    ${notif_elements.notif_allow}
    ${present}=  Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible    ${notif_elements.notif_allow}
    IF    "${present}" == 'True'
        AppiumLibrary.Click Element    ${notif_elements.notif_allow}
    ELSE
        Log To Console    Permisstion Allow Button is NOT Present
    END

Click Dont Allow Notification
    AppiumLibrary.Wait Until Element Is Visible    ${notif_elements.notif_dont_allow}
    ${present}=  Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible    ${notif_elements.notif_dont_allow}
    IF    "${present}" == 'True'
        AppiumLibrary.Click Element    ${notif_elements.notif_dont_allow}
    ELSE
        Log To Console    Permisstion Dont Allow Button is NOT Present
    END

Verify Notification
    AppiumLibrary.Wait Until Element Is Visible    ${notif_elements.notif_message}
    AppiumLibrary.Element Should Contain Text    ${notif_elements.notif_message}    Please enjoy this notification

Verify No Notification
    AppiumLibrary.Page Should Not Contain Element    ${notif_elements.notif_message}

Open Notification
    AppiumLibrary.Open Notifications

Clear Notification
    AppiumLibrary.Wait Until Element Is Visible    ${notif_elements.notif_clear} 
    AppiumLibrary.Click Element    ${notif_elements.notif_clear}

Press Keycode Back
    AppiumLibrary.Press Keycode    4