# Swift CLI Spinners
[![Build Status](https://travis-ci.com/dominicegginton/Spinner.svg?branch=master)](https://travis-ci.com/dominicegginton/Spinner) 
[![GitHub release](https://img.shields.io/github/release/dominicegginton/spinner.svg)](https://github.com/dominicegginton/Spinner/releases)
[![GitHub](https://img.shields.io/github/license/dominicegginton/spinner.svg)](https://github.com/dominicegginton/Spinner/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/dominicegginton/Spinner.svg)](https://github.com/dominicegginton/Spinner/issues)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-Compatible%20-green.svg)](https://swift.org/package-manager/)
> Full featured Swift library for creating powerful CLI Spinners 🔥

<p align="center">
	<br>
	<img src="https://raw.githubusercontent.com/dominicegginton/Spinner/master/Assets/demo.gif">
	<br>
	<br>
</p>

## Key Features
- Over ****60**** built in animations 🤩
- Built in completion functions (Success, Failure, Warning, Information) ✔
- Easily create your own custom Spinner animations
- Use color to make your Spinners stand out 🎨

## Install 
To install within your Swift project add the GitHub url to your `Package.swift` file as a dependency. 
[**Swift Package Manger**](https://swift.org/package-manager/) will sort everything out for you when you run `swift build` 💪
``` swift
.package(url: "https://github.com/dominicegginton/Spinner", from: "1.1.0")
```

## Getting Started
To create a simple for `2` seconds spinner:
``` swift
import Spinner

let mySpinner = Spinner(.dots, "My Spinner")
mySpinner.start()
sleep(2)
mySpinner.stop()
```

Updating the user with a completion type can be useful for example:
``` swift
mySpinner.succeed("Task Completed")
```
## Documentation

#### Creating a Spinner
When creating an instance of `Spinner` the initializer takes the following arguments:
- `pattern: SpinnerPattern` the pattern that the spinner will display
- `text: String` the text that will displayed next to the spinner
- `speed: Double` the speed the spinner will update at
- `color: Color` the color of the spinner - default is

``` swift
let mySpinner = Spinner(.dots, "My Spinner", speed: 0.5, color: .lightMagenta)
```
#### Starting the Spinner 🏁
To start a spinner call the `.start()` function. This will hide the curser and start the spinner animation.
``` swift
mySpinner.start()
```
#### Stopping the Spinner 🛑
To stop a Spinner object calling `.stop()` will stop the animation on the current frame, return to a new line along with re enabling the curser. However to update the Spinner with a final frame and text can be extremely usefully for the user in some cased, to do this you can pass the following arguments to the `.stop()` function:
- `finalFrame: String` The final frame the Spinner will display
- `text: String` The text displayed by the Spinner once stopped
- `color: Color` The color the Spinner will display the pattern in
``` swift
mySpinner.stop(finalFrame: "!", text: "Final Text", .cyan)
``` 
#### Clearing the Spinner 🧽
It might be important to stop the Spinner and clear it at the same time, `.clear()` is the function to call if you're looking for this.
``` swift
mySpinner.clear()
```
#### Completion Types ✅
As you're using a spinner to display information to the user it might be usefully to provide a  type when stopping the Spinner. There are 4 different built-in types for different states: `.succeed()`, `.failure()`, `.warning()` and `.information()`. Each completion type also takes these arguments:
- `text: String` The text that will displayed next to the stopped Spinner
``` swift
mySpinner.succeed("Passed")
```
#### Creating Custom Patterns 🔥
We have ****60**** animated spinner patterns for you to choose from however you may want to create your own. This can easily be done by defining a multiFrame `SpinnerPattern()`, the default speed for custom multiFrame patterns is `0.08`, to change with pass a double representing the speed to the init of the Spinner.
``` swift
let customPattern = SpinnerPattern(multiFrame: ["1","2","3","4","5"])
let mySpinner = Spinner(customPattern, "My Spinner", speed: 0.3, color: .blue)
```
## Community
Many thanks for the 60 plus spinner frames that can be found over at [sindresorhus](https://github.com/sindresorhus/cli-spinners) repo built in JavaScript.