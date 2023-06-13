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
    robot -d ../reports tests.robot
