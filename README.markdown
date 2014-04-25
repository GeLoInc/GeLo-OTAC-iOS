# GeLo Beacon Over-The-Air Configuration

This project is the source code for the iOS app that allows you to configure a GeLo beacon ( http://www.gelosite.com ). 

## Dependencies

* CocoaPods (http://www.cocoapods.org)
* Block-KVO (see Podfile for version requirements)

## Activating Configuration Mode On Your GeLo Beacon

You need a physical GeLo v2 beacon to do this. _Please note that activating configuration mode disables normal advertising of your beacon. When you exit configuration mode the beacon will restart and resume normal advertisements._

* Swipe magnet across top of the beacon to enable configuration mode
* Launch this app
* The app will find your beacon and you will be requested to pair with your device
* Enter the passcode for your beacon
* You will now see a list of all configurable properties on your beacon
* Tap "Done" when done configuring your beacon to restart it in advertisement mode

## GeLo

See http://www.gelosite.com


