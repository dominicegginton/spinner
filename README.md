# Swift CLI Spinners

[![Build Status](https://travis-ci.com/dominicegginton/Spinner.svg?branch=master)](https://travis-ci.com/dominicegginton/Spinner)

> Terminal Spinner library for use within your amazing Swift projects. Discover over 60 unique spinner animations, along with the ability to easily create frame by frame animated spinners yourself.

<p align="center">
	<br>
	<img src="Assets/demo.gif">
	<br>
	<br>
</p>


## Key Features

- Over **60** animated spinners for use within your Swift project
- Easily create custom spinners with single and multiple frames
- Completion types allow for easily displaying of critical functions (success, failure, warning, information)
- Create your own completion types with custom frames

## Install 

[**Swift Package Manger**](https://swift.org/package-manager/).

``` swift
// swift-tools-version:4

import PackageDescription

let package = Package(
    name: "YourAmazingSoftware",
    dependencies: [
        package(url: "https://github.com/dominicegginton/Spinner", from: "1.0.0")
    ]
)
```
Running `swift build` will install and compile everything for you 💪

## Usage
To create a simple spinner for a couple of seconds it is easy with `Spinner()` class. 

```swift
var mySpinner = Spinner(.dots, "My Custom Spinner")

mySpinner.start()

sleep(2)

mySpinner.stopAndClear()
```

### Completion Types
Clearing the spinner after stopping is often not a desirable outcome as spinners are commonly used for showing progress on a task. Once a task is completed you can provide a `CompletionType` to the spinner along with custom text to display completed spinner.

```swift
mySpinner.stop(.success, text: "Task Completed")
```

There are pre-defined completion types that can be passes to the stop function.

- `.success` : Shows a green ✔ icon
- `.failure` : Shows a red ✖ icon
- `.warning` : Shows a yellow ⚠ icon
- `.information` : Shows a blue ℹ icon

You can make a custom completion type by passing a `String` to act as a single frame pattern.
```swift
let myCustomCompletionType = CompletionType("*")

mySpinner.stop(myCustomCompletionType)
```

### Custom Patterns
While the Spinner comes with over 60 different patterns to type you may want to use your own. A `Pattern` can be initialized with ether and single frame (String) or multiple frames (Array of Strings). When creating a multiple frame pattern make sure that the frame width is consistent.

```swift
let myCustomPattern = Pattern(multiFrame: ["a", "b", "c", "d", "e"])

var mySpinner = Spinner(myCustomPattern, "My Custom Spinner")

mySpinner.start()
```

## Community

Many thanks for the 60 plus spinner frames that can be found over at [sindresorhus](https://github.com/sindresorhus/cli-spinners) repo build in JavaScript.

Another huge thanks to [kiliankoe](https://github.com/kiliankoe/CLISpinner) for the inspiration to create a more stable and feature rich Swift Spinner.