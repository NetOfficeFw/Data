##!/usr/bin/env bash

APP='Microsoft PowerPoint'

libs=(
  OLEAutomation
  OLE
  COMBase
  'Visual Basic for Applications'
  mso20
  ADAL4
  WLMKernel
  WLMUser
)

/usr/libexec/PlistBuddy -c "print CFBundleVersion" "/Applications/$APP.app/Contents/Info.plist" | awk '{print "CFBundleVersion="$1}' > "version.txt"
/usr/libexec/PlistBuddy -c "print MicrosoftBuildNumber" "/Applications/$APP.app/Contents/Info.plist" | awk '{print "MicrosoftBuildNumber="$1}' >> "version.txt"
/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "/Applications/$APP.app/Contents/Info.plist" | awk '{print "CFBundleShortVersionString="$1}' >> "version.txt"
cp "/Applications/$APP.app/Contents/Info.plist" Info.plist
plutil -convert xml1 Info.plist

for lib in "${libs[@]}"; do
  echo $lib
  mkdir -p "$lib"
  binpath="/Applications/$APP.app/Contents/Frameworks/$lib.framework/Versions/A/$lib"
  nm -m "$binpath" | c++filt | cut -c 18- > "$lib/exports.txt"
  otool -L "$binpath" > "$lib/libraries.txt"
done
