# PhocaLargha

[![Version](https://img.shields.io/cocoapods/v/PhocaLargha.svg?style=flat)](https://cocoapods.org/pods/PhocaLargha)
[![License](https://img.shields.io/cocoapods/l/PhocaLargha.svg?style=flat)](https://cocoapods.org/pods/PhocaLargha)
[![Platform](https://img.shields.io/cocoapods/p/PhocaLargha.svg?style=flat)](https://cocoapods.org/pods/PhocaLargha)

# About
This library makes it easy to display the walkthrough in the application simply by writing a few lines of code.
You can customize various color backgrounds, titles, buttons, etc., and you can also define completion handlers.

# Requirements
- iOS9*

# Installation
PhocaLargha is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PhocaLargha'
```


# Get Started
How to display the simplest alert view.

```swift
let popNavi = PopNavi()
let firstViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
footerComponent: lastFooterComponent, image: firstImage,
baseViewColor: dialogColor)

popNavi.setBaseView(baseViewComponent: firstViewComponent, isLastView: true)
popNavi.configureNavigation()
popNavi.slideUp(duration: 0.7)
```

<img src="https://user-images.githubusercontent.com/17525335/43888072-8d858ef0-9bfb-11e8-9a97-774bcb0d9f87.gif" width="250">

It is also possible to display walkthroughs using multiple custom views.

```swift
let firstViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
footerComponent: footerComponent, image: firstImage,
baseViewColor: dialogColor)
let secondViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
footerComponent: footerComponent, image: secondImage,
baseViewColor: dialogColor)
let thirdViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
footerComponent: lastFooterComponent, image: thirdImage,
baseViewColor: dialogColor)
let popNavi = PopNavi()

popNavi.setBaseView(baseViewComponent: firstViewComponent, isLastView: false)
popNavi.setBaseView(baseViewComponent: secondViewComponent, isLastView: false)
popNavi.setBaseView(baseViewComponent: thirdViewComponent, isLastView: true)
popNavi.configureNavigation()
popNavi.slideUp(duration: 0.7)
```

<img src="https://user-images.githubusercontent.com/17525335/43888081-9053fcca-9bfb-11e8-9743-ff87117ba571.gif" width="250">


# Customize

<img src="https://user-images.githubusercontent.com/17525335/43888792-7ff33358-9bfd-11e8-8c2d-f047aaa2bf9f.gif" width="250"/><img src="https://user-images.githubusercontent.com/17525335/43888095-9ce1730a-9bfb-11e8-8729-8865caf51300.gif" width="250"/><img src="https://user-images.githubusercontent.com/17525335/43888090-99700c2c-9bfb-11e8-9d16-bd7a71dde4a8.gif" width="250"/><img src="https://user-images.githubusercontent.com/17525335/43888103-a17fad8c-9bfb-11e8-8895-416e616adc96.gif" width="250"/><img src="https://user-images.githubusercontent.com/17525335/43888088-96898024-9bfb-11e8-9936-88ebe5d7462f.gif" width="250"/><img src="https://user-images.githubusercontent.com/17525335/43888097-9f577788-9bfb-11e8-951a-ab1ab01b26d5.gif" width="250"/>

There are two customization setting methods in this library.

### 1. PopNaviConfigureOption
It is a structure that customizes the component that is placed mainly in the background of the custom view.

```swift
let popNavi = PopNavi()
popNavi.configureOption.xxx = yyy // Look at the following

.backgroundColor // Change background color. The default is black background.
.backgroundAlpha // Change background alpha. The default is 0.5.
.pageControlColor // Specify the color of the page control The default is orange.
.isDismissibleForTap // Determining whether to close view when tapping background. The default is true.
.shouldDisplayPageControl // Display judgment of page control.
.backgroundViewGradientType // Specify the gradation style of the background. The default is black background.
.completion // Set handler when view is closed.
```

### 2. ComponentConfigure
It is a structure that mainly configures components of custom view.

```swift
let firstViewComponent = BaseViewComponent(viewType: ViewType,
cornerRadius: CGFloat = 10,
topComponent: TopComponent? = nil,
footerComponent: FooterComponent? = nil,
image: UIImage,
baseViewColor: UIColor = .white)

viewType // You can choose 3 different custom view sizes.
cornerRadius // Specify the corner radius of the custom view.
topComponent // A component for displaying the title of a custom view. If nothing is specified, this component will not be displayed.
footerComponent // Component for displaying buttons at the bottom of the custom view. It will not be displayed if nothing is specified.
image // Set the image to be displayed in the middle of the custom view.
baseViewColor // Set color scheme of custom view.
```

## Author

[takuyama29](https://github.com/yamataku29)

