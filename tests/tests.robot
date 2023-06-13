*** Settings ***
Documentation    Suite description

Resource    ../utils/keywords.robot
Resource    ../page_objects/color_po.robot
Resource    ../page_objects/notification_po.robot
Resource    ../page_objects/text_po.robot
Resource    ../page_objects/toast_po.robot
Resource    ../page_objects/speed_po.robot
Resource    ../page_objects/home_po.robot

Test Setup  Run Keywords  Open Proverbial App
Test Teardown  Close Application

*** Test Cases ***
Positive: Click Color Button And Verify Color Change
    Click Color Button
    Verify Color Change

Positive: Click And Verify Notification
    Click Notification Button
    Click Allow Notification
    Click Notification Button
    Open Notification
    Verify Notification
    Press Keycode Back

Negative: Click And Verify Notification
    Click Notification Button
    Click Dont Allow Notification
    Click Notification Button
    Open Notification
    Verify No Notification
    Press Keycode Back

Positive: Click And Verify Text Value
    Click Text Button
    Verify Text Value

Positive: Click And Verify Toast
    Click Toast Button
    Sleep    1
    Verify Toast Value

Positive: Click And Verify Speed Test
    Click Speed Test Button
    Sleep    10
    Click Go Button
    Capture Speed Test
    Click Home Button