# FluidHighlighter
[![Cocoapods](https://img.shields.io/cocoapods/v/FluidHighlighter.svg?style=flat)](https://cocoapods.org/pods/FluidHighlighter)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://raw.githubusercontent.com/k-lpmg/FluidHighlighter/master/LICENSE)

FluidHighlighter easily implements the Fluid Interface based highlighting effect on UIView and UIControl.

## Introduction
<img src="https://user-images.githubusercontent.com/15151687/52348602-13489500-2a68-11e9-9997-343d9401880c.gif" width="375" height="667">

## Usage

#### Highlighting enable
```swift
view.fh.enable(normalColor: UIColor.white, highlightedColor: UIColor.gray)
control.fh.enable(normalColor: UIColor.white, highlightedColor: UIColor.gray)
```

#### Highlighting disable
```swift
view.fh.disable()
control.fh.disable()
```

#### Enable Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| `normalColor` | `UIColor` | Background color |
| `highlightedColor` | `UIColor`
| `selectedColor` | `UIColor` | Background color selected | | Only in UIControl |
| `highlightedOptions` | `AnimationOptions`
| `highlightedDelay` | `TimeInterval`
| `highlightedDuration` | `TimeInterval` 


## Installation

#### CocoaPods (iOS 8+)

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'FluidHighlighter'
end
```

### Carthage (iOS 8+)

```ruby
github "k-lpmg/FluidHighlighter"
```


## LICENSE

These works are available under the MIT license. See the [LICENSE][license] file
for more info.

[license]: LICENSE
