# GeLo Beacon Over-The-Air Configuration

This project is the source code for the iOS app that allows you to configure a GeLo beacon ( http://www.gelosite.com ).

## Running locally

### Step 1: Clone the project

        git clone https://github.com/GeLoInc/GeLo-Beacon-OTA-Configuration-iOS.git
        cd GeLo-Beacon-OTA-Configuration-iOS

### Step 2: Install dependencies

You'll need CocoaPods (http://www.cocoapods.org) to install dependencies. You can check to see if you have it installed by running:

        pod --version

If you see "pod: command not found" then you'll need to install it:

        gem install -r cocoapods

To verify it installed run `pod --version` again.

Now install dependencies:

        pod install

### Step 3: Open xcworkspace

        open GeLoBeaconOTAConfiguration.xcworkspace

The app needs to be run on a device and won't be usable in the simulator. This is due to the fact that iOS7 and later have removed Bluetooth support from the simulator.

## Configuring your GeLo Beacon

You need a physical GeLo v2 beacon to do this. _Please note that activating configuration mode disables normal advertising of your beacon. When you exit configuration mode the beacon will restart and resume normal advertisements._

* Swipe magnet across top of the beacon to enable configuration mode
* Launch this app
* The app will find your beacon and you will be requested to pair with your device
* Enter the passcode for your beacon
* You will now see a list of all configurable properties on your beacon
* Tap "Done" when done configuring your beacon to restart it in advertiser mode

Note: due to iOS caching it is often quicker to find your beacon in maintenance mode by turning bluetooth off and back on when you pull up the maintenance up. Otherwise, iOS may keep a cached copy of the device from when it was seen in advertiser mode.

## Questions, Comments, Suggestions

For questions about this project specifically feel free to file a Github issue.

For more general questions, comments, or suggestions contact GeLo directly at tech@gelosite.com

http://www.gelosite.com


