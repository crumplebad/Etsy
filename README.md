# Etsy

Etsy is an iOS application that searches listings using Etsy’s public API.
- One can enter a search keyword
- Scroll through the search results
- Each search result shows the listing title, brief description and a listing image
- When one scrolls to the bottom of the search results, more results load at the bottom of the
page ("infinite scroll")

### Architecture
Etsy app uses VIPER (View, Interactor, Presenter, Entity, Router aka WireFrame) instead of the much loved and hated MVC (Model View Controller), which results in Massive View Controllers. Use of StoryBoard makes having Router challenging and less relevant, hence this project uses .xib files.  

### Enhancements
> Keep improving.
- add Unit tests.
- add Custom Error Objects instead of NSString.
- make view controller lighter by moving some of its responsibility to the presenter. 

### Version
1.0.0

### Tech

This project uses a number of open source projects namely:

* [Carthage] - For dependency management.
* [AFNetworking] - A delightful networking framework for iOS, OS X, watchOS, and tvOS

### Installation/Run
Etsy uses iOS 10.3 SDK and Xcode 8.3.3
Install Carthage before compiling Etsy app

```sh
$ cd <to project folder>
$ carthage update --platform iOS
```
Etsy app uses Carthage instead of CocoaPods for the simplicity and ease of use. Its very easy to replace Carthage by other dependency managers, unlike CocoaPods .

### Extra Note
    StyleSettings.plist is used for [Objective Clean]. This [average style] setting is provided by Objective Clean. Rename Etsy.BACKUPxcodeproj to Etsy.xcodeproj to run Objective Clean. Objective Clean is available on [AppStore].


[Carthage]:<https://github.com/Carthage/Carthage>
[AFNetworking]: <http://afnetworking.com>
[Objective Clean]:<http://objclean.com/index.php>
[AppStore]:<https://itunes.apple.com/us/app/objective-clean/id713910413?ls=1&mt=12>
[average style]:<http://objclean.com/survey.php>
