# JTransactions 🍔

![](./appicon.png)

[![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg?style=for-the-badge)](https://www.apple.com/br/ios/ios-16.0/)
[![Compatibility](https://img.shields.io/badge/Compatibility-iPhone%20-lightgrey.svg?style=for-the-badge)](https://www.apple.com/br/iphone/)

[![Platform](https://img.shields.io/badge/iOS_Version-16.0+-green.svg?style=for-the-badge)](https://www.apple.com/br/ios/ios-16.0/)
[![Swift Version](https://img.shields.io/badge/swift-5.0-orange.svg?style=for-the-badge)](https://swift.org/)
[![XCode Version](https://img.shields.io/badge/Xcode_Version-14.1+-blue.svg?style=for-the-badge)](https://developer.apple.com/xcode/)

## Welcome

Project based on trasactions list API, to show a list of transactions and detail for each.

### Project features
- App iOS
- Basic integration with github actions for CI
- Unit tests
- Auto Layout
- Code coverage (with Slather)

### App Main features
- Show list of transactions (grouped by month)
- Show detail of each transaction

### Available resources
- Loading state
- Empty state
- Error state
- Transition Animations

### Developing

#### Architecture
[VIPER](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6)

###### Why VIPER?
- Clean architecture
- Isolation of each layer
- Scalable

*PS. This is a small project, but VIPER was chosen thinking in a complex project, and I'm familiar with that im my day-to-day*

#### Tools
- [Bundle](https://bundler.io) 
- [Fastlane](https://fastlane.tools) 
- [Slather](https://github.com/SlatherOrg/slather)


#### How to build and run
This project don't use any third party libraries. So just open `JTransactions.xcodeproj` and run it on iPhone device or simulator.

#### How to run tests

The project use `Bundler` to manage all gem dependencies, so first we have to install it (if you it installed, skip to next step):
```shell
sudo gem install bundler
```
Aftter installed, install your gem dependencies using this command in main folder of project:
```shell
bundle install
```
Unit tests can be run by Xcode or on your terminal (CLI) with `Fastlane`, if you run with fastlane it you generate a full report html.

To run with `Fastlane`:
```shell
bundle exec fastlane unit_tests
```

### Requirements
* iOS Version: 16.1+
* Xcode Version: 14.0+
* Swift Version: 5.0

### Helpers
* [VIPER](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6)
* [SafeAsync](https://gist.github.com/jonahaung/ed4c2f83bc8a650538b0f74421b042b8)
* [ImageView with Download URL](https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
)
* [Swift .gitignore](https://github.com/github/gitignore/blob/main/Swift.gitignore)