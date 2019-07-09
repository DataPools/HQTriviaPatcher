# HQTriviaPatcher
## Requirements
- ADB
- apktool
- Java 8 or higher
- git
## Instructions
1. Open Terminal/cmd.exe
2. Clone the repo by using `git clone https://github.com/DataPools/HQTriviaPatcher`
3. Navigate into the directory using `cd HQTriviaPatcher`
4. Execute ```keytool -genkey -v -keystore my-release-key.jks -alias my-alias -keyalg RSA -keysize 2048 -validity 10000```, make sure that you remember the password you set.
5. Connect an Android device with HQTrivia installed to the computer.
6. Run patch.sh with `chmod +x patch.sh && ./patch.sh`
7. Delete the HQTrivia app off the Android device.
8. Use `adb install HQTrivia-Patched.apk` to install the patched app on to your device.

## How it works
This searches every .smalli file within its directory (recursively) in order to find two lines of code. This program disables the app's certificate pinning and SSL socket capability. This makes it much easier MITM the app using a program such as Charles Proxy or force the app to connect to a dummy websocket for testing. 
