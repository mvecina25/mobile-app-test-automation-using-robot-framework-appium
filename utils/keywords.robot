*** Settings ***
Library    OperatingSystem
Library    AppiumLibrary

Variables   ../resources/config.yaml

*** Variables ***
${PLATFORMNAME}    ${EMPTY}
${ENV}             ${EMPTY}

*** Keywords ***
Get Simulator UDID
    ${udid} =    Run    xcrun simctl list | egrep '(Booted)' | grep -o "(.*" | cut -d'(' -f2 | tr -d ')'
    Set Global Variable    ${DEVICE_UDID}    ${udid}

Open Proverbial App
    
    IF    '${PLATFORMNAME}' == 'android'
        Open Android Application
    ELSE IF    '${PLATFORMNAME}' == 'ios'
        Open iOS Application
    END

Open Android Application
    Open Application
    ...    ${${ENV}_ENV}                                #Appium server url
    ...    platformName=${ANDROID_PLATFORM}             #The type of platform hosting the app
    ...    deviceName=${ANDROID_DEVICE_NAME}            #The name of a particular device to automate, e.g., emulator-5554, iPhone 14
    ...    automationName=${ANDROID_AUTOMATION_NAME}    #Which automation engine to use
    ...    appPackage=${ANDROID_APP_PACKAGE}            #The absolute local path or remote http URL to a .ipa or .apk
    ...    appActivity=${ANDROID_APP_ACTIVITY}          #Finding App Package and Activity. Use 'adb devices' command. For MAC 'adb shell dumpsys window | grep -E 'mCurrentFocus'.

Open iOS Application
    Run Keyword    Get Simulator UDID
    Open Application
    ...    ${${ENV}_ENV}                                #Appium server url
    ...    platformName=${IOS_PLATFORM_NAME}            #The type of platform hosting the app
    ...    deviceName=${IOS_DEVICE_NAME}                #The name of a particular device to automate, e.g., emulator-5554, iPhone 14
    ...    automationName=${IOS_AUTOMATION_NAME}        #Which automation engine to use
    ...    app=${IOS_APP}                               #The absolute local path or remote http URL to a .ipa or .apk
    ...    udid=${DEVICE_UDID}                          #Unique device identifier of the connected device
    ...    platformVersion=${IOS_OS_VERSION}            #Mobile OS version



