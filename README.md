# myTracker iOS SDK

![Platforms][platforms-svg]
[![License][license-svg]][license-link]

[![Podspec][podspec-svg]][podspec-link]

myTracker — free mobile analytics for iOS and Android platforms. Get connected to know everything about your apps, audience and advertising campaigns.

## Integrate

**Installation**
 - **[Swift Package Manager](https://github.com/myTrackerSDK/mytracker-ios-spm)**
 
   Do the next steps:
   * Open your project in XCode
   * Use menu to open Swift Package Manager
      * File -> Swift Packages -> Add Package Dependency...
   * Use the repository URL to add MyTrackerSDK as a dependency with a required version
   * Also you have to add dependencies manually:
     * AdSupport
     * SystemConfiguration
     * CoreTelephony 
     * CoreData 
     * UIKit 
     * iAd 
     * StoreKit 
     * CoreMotion
- **[CocoaPods](https://cocoapods.org/pods/myTrackerSDK)**

  Add the following line to your Podfile:
   ```ruby
   pod 'myTrackerSDK'
   ```
  Run `pod install`

Integration instructions are available on our [website](https://tracker.my.com/docs/).

Demo-app with examples of integration available in [myTrackerDemo folder](https://github.com/myTrackerSDK/mytracker-ios/blob/master/myTrackerDemo).

## Requirements

iOS 9.0

[license-svg]: https://img.shields.io/badge/license-LGPL-lightgrey.svg
[license-link]: https://github.com/myTrackerSDK/mytracker-ios/blob/master/LICENSE

[podspec-svg]: https://img.shields.io/cocoapods/v/myTrackerSDK.svg
[podspec-link]: https://cocoapods.org/pods/myTrackerSDK

[platforms-svg]: https://img.shields.io/cocoapods/p/myTrackerSDK.svg
