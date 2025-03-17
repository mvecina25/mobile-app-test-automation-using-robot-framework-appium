## Folder Structure
#### pages_objects/:
This folder contains the elements of each page and functions which perform operations on those elements.
#### reports/:
This folder contains the output reports of test runs including logs, screenshots, and metrics.
#### resources/:
This folder contains configuration files for the automation framework such as settings for the test environment, test data, and test execution parameters.
#### tests/:
This folder contains the actual test cases.
#### utils/:
This folder contains utility scripts and functions that may be used by the tests.

## Setup
* Setup Android Virtual Device
    ```
    1. Download and install Android Studio.
    2. Create AVD using Android Studio

* Setup Environment Variable
   ```
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

* List Available AVDs
   ```
   emulator -list-avds

* Start the Emulator and check if it's working
   ```
   emulator -avd <AVD_NAME>

* Setup Appium Server
  ```
    1. Download and install Appium Desktop here: https://github.com/appium/appium-desktop

* Install packages
   ```
    1. pip3 install -r requirements.txt

* Add a .vscode/settings.json file in your project directory
   ```
    {
        "robot.pythonpath": [
            "${workspaceFolder}/venv/bin/python3.11",
            "${workspaceFolder}/venv/lib/python3.11/site-packages"
        ],
        "python.defaultInterpreterPath": "${workspaceFolder}/venv/bin/python3.11"
    }

## How To Run
* Terminal
    ```
    1. robot -v ENV:QA -v PLATFORMNAME:android -d ../reports tests/tests.robot


https://github.com/mvecina25/mobile-app-test-automation-using-robot-framework-appium/assets/32367570/c7ce27a5-56cf-4d2b-8403-7bf1bd23f5ce

Scenarios:
1. On the home screen, I clicked on "COLOR" and verified that there was a change in color.
2. On the home screen, I clicked on "NOTIFICATION" and confirmed that a notification was received on the device.
3. On the home screen, I clicked on "TEXT" and captured the displayed text on the home screen.
4. On the home screen, I clicked on "TOAST" and verified the observation of a pop-up message.
5. On the home screen, I clicked on "SPEED TEST" and navigated to the speed testing screen. I captured the upload/download speed recorded and successfully returned to the home screen after completing the speed test.

Other information:
1. Incorporated both positive and negative test cases.
2. Included a README file.
3. The test framework is designed to run in multiple environments such as DEV, QA, and PROD
4. The test framework effectively handles sensitive information by externalizing data using .YAML
5. The test framework is designed with minimal code redundancy.
