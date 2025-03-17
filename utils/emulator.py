import subprocess
import time

def start_emulator(avd_name):
    """
    Start the Android emulator with the given AVD name.
    """
    # Command to start the emulator
    emulator_command = f"emulator -avd {avd_name} -no-snapshot-load"
    print(f"Starting emulator: {avd_name}")

    # Start the emulator process
    emulator_process = subprocess.Popen(emulator_command, shell=True)
    print(f"Emulator started with PID: {emulator_process.pid}")

    # Wait for the emulator to boot
    time.sleep(30)  # Adjust the sleep time as needed
    print("Emulator booted successfully")

    # Return the process object for later termination
    return emulator_process

def stop_emulator(device_name="emulator-5554"):
    """
    Stop the Android emulator using adb.
    """
    # Command to stop the emulator
    stop_command = f"adb -s {device_name} emu kill"
    print(f"Stopping emulator: {device_name}")

    # Execute the stop command
    subprocess.run(stop_command, shell=True, check=True)
    print("Emulator stopped successfully")

def start_appium_server(address="0.0.0.0", port="4723"):
    """
    Start the Appium server with the specified address and port.
    """
    # Command to start Appium server
    appium_command = f"appium --address {address} --port {port}"
    print(f"Starting Appium server at {address}:{port}...")

    # Start the Appium server process
    appium_process = subprocess.Popen(
        appium_command,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    print(f"Appium server started with PID: {appium_process.pid}")

    # Return the process object for later termination
    return appium_process

def stop_appium_server(appium_process):
    """
    Stop the Appium server by terminating the process.
    """
    if appium_process:
        print("Stopping Appium server...")
        appium_process.terminate()  # Gracefully terminate the process
        appium_process.wait()  # Wait for the process to terminate
        print("Appium server stopped successfully")
    else:
        print("No Appium server process to stop")