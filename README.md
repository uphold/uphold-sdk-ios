# Bitreserve SDK for iOS

Bitreserve is a next generation platform that allows anyone to transfer and exchange value for free, instantly and securely.

The Bitreserve SDK for iOS provides an easy way for developers to integrate iOS applications with the [Bitreserve API](https://developers.bitreserve.org).

## Requirements

    * Xcode 7
    * Swift 2
    * Carthage or CocoaPods

## Installation

### Using [CocoaPods](https://cocoapods.org)

1. Create `Podfile`.

    ```
    platform :ios, '9.0'
    use_frameworks!

    pod 'BitreserveSdk'
    ```

2. Run `pod install`.

### Using [Carthage](https://github.com/Carthage/Carthage)

1. Create `Cartfile`.

    ```
    github "bitreserve/bitreserve-sdk-ios" ~> 0.1.0
    ```

2. Run `carthage update --platform iOS`.
