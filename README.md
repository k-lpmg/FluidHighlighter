# FluidHighlighter
[![Build Status](https://travis-ci.org/k-lpmg/FluidHighlighter.svg?branch=master)](https://travis-ci.org/k-lpmg/FluidHighlighter)
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Cocoapods](https://img.shields.io/cocoapods/v/FluidHighlighter.svg?style=flat)](https://cocoapods.org/pods/FluidHighlighter)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

FluidHighlighter easily implements the Fluid Interface based highlighting effect on UIView and UIControl.

## Introduction
<img src="https://user-images.githubusercontent.com/15151687/52348602-13489500-2a68-11e9-9997-343d9401880c.gif" width="375" height="667">

## Usage

#### Highlighting enable
```swift
let view = UIView()
view.fh.enable(normalColor: UIColor.white, highlightedColor: UIColor.gray)

let control = UIControl()
control.fh.controlEnable(normalColor: UIColor.white, highlightedColor: UIColor.gray)
```

#### Highlighting disable
```swift
let view = UIView()
view.fh.disable()

let control = UIControl()
control.fh.controlDisable()
```

#### Enable Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| `normalColor` | `UIColor` | Background color |
| `highlightedColor` | `UIColor`
| `selectedColor` | `UIColor` | Background color of selected state, only in UIControl |
| `highlightedOptions` | `AnimationOptions`
| `highlightedDelay` | `TimeInterval`
| `highlightedDuration` | `TimeInterval` 


## Installation

#### CocoaPods (iOS 8+)

```ruby
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'FluidHighlighter'
end
```

#### Carthage (iOS 8+)

```ruby
github "k-lpmg/FluidHighlighter"
```


## LICENSE

These works are available under the MIT license. See the [LICENSE][license] file
for more info.

[license]: LICENSE
