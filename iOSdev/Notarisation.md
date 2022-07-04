# Notarisation process

Apple needs to notarise the macos installer package before it can be distributed. During the notarization process, the installer package is submitted to Apple notary service to check for malicious software. If its accepted then there will be a ticket attached to the installer package.

This process can be done with the below Terminal commands.

```sh
xcrun notarytool store-credentials "demo-cre"--apple-id "selvarajan@gmail.com" --team-id "BY6*******"
# provide app specific password when asked

xcrun notarytool submit demo-osx-installer.zip --keychain-profile "demo-cre" --wait --webhook "https://selvarajan.in"
```
