# ncmb_ios-Swift

A private translation of NCMB SDK for iOS (ncmb_ios) into Swift

Translated by OOPer in cooperation with shlab.jp, since 2019/5/1.

Based on
[ncmb_ios](https://github.com/NIFCloud-mbaas/ncmb_ios),
SDK version 3.0.1 for API version "2013-09-01".

(Not based on ncmb_swift.)

All license terms follow the original license shown in LICENSE-original.txt or in each file.

## Reasons you should _not_ use this SDK

- This is a private and experimental translation, many features are NOT tested.
- You can import and use the original SDK from Swift project. Or you can choose [ncmb_swift](https://github.com/NIFCloud-mbaas/ncmb_swift) if you want to experiment a Swift version of SDK.
- This project is not designed to work with pods or Carthage.
- I have removed many *synchronous* features, as they are harmful, and renamed many methods and properties and classes. Most Swift code written for the official SDK would not compile with this SDK.
- You should not expect official supports from ニフクラ if you use this SDK.

There may be more.

This repository is being public, as the original SDK is open-sourced.

### Build requirement

Xcode 10.2.1, Swift 5

### Runtime requirement

iOS 8.0 or later

