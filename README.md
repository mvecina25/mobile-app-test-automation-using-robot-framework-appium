## Folder Structure
#### pages/:
This folder contains the elements of each page and functions which perform operations on those elements.
#### reports/:
This folder contains the output reports of test runs including logs, screenshots, and metrics.
#### resources/:
This folder contains configuration files for the automation framework such as settings for the test environment, test data, and test execution parameters.
#### tests/:
This folder contains the actual test cases.
#### utils/:
This folder contains utility scripts and functions that may be used by the tests.

## How To Run
* Terminal
    ```
    # Install packages
    pip3 install -r requirements.txt

    # How To Run
    cd ../tests
    robot -v ENV:QA -v PLATFORMNAME:android -d ../reports tests.robot


https://github.com/mvecina25/mobile-app-test-automation-using-robot-framework-appium/assets/32367570/c7ce27a5-56cf-4d2b-8403-7bf1bd23f5ce
