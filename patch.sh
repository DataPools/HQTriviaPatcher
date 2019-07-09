#!/bin/bash
echo "Removing leftover files"
rm HQTrivia-Temp.apk >> /dev/null 2>&1
rm HQTrivia-Patched.apk >> /dev/null 2>&1 
rm base.apk >> /dev/null 2>&1
rm -r base >> /dev/null 2>&1
echo "Pulling HQTrivia APK from phone"
adb pull data/app/com.intermedia.hq-1/base.apk base.apk
echo "Decompiling apk"
apktool d -r base.apk >> /dev/null 2>&1
echo "Patching APK"
java -jar HQSmaliPatcher.jar
echo "Building new APK"
apktool b base -o HQTrivia-Temp.apk
chmod +x zipalign
./zipalign -p 4 HQTrivia-Temp.apk HQTrivia-Patched.apk
echo "Type in the keystone password"
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.jks HQTrivia-Patched.apk my-alias
echo "Done!"
