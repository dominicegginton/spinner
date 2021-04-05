<h1 align='center'>Spinner</h1>
<h4 align='center'>Powerful Swift CLI Spinners

<div align='center'>
	<br>
	<img src='https://img.shields.io/github/workflow/status/dominicegginton/Spinner/CI?label=CI'>
	<img src='https://img.shields.io/github/v/tag/dominicegginton/Spinner?include_prereleases&label=Release'>
	<br>
	<br>
	<img  src="https://raw.githubusercontent.com/dominicegginton/Spinner/master/Assets/demo.gif">
	<br>
	<br>
</div>

## Key Features

- Over **80** beautiful built-in spinner animations
- Easily create custom spinners animations and formats
- Built-in completion functions (Success, Failure, Warning, Information)
- Support for colors using [rainbow](https://github.com/onevcat/Rainbow)

## Install 

Install via the [**Swift Package Manger**](https://swift.org/package-manager/) by declaring **Spinner** as a dependency in your  `Package.swift`:

``` swift
.package(url: "https://github.com/dominicegginton/Spinner", from: "1.1.4")
```

Remember to add **Spinner** to your target as a dependency:

``` swift
.target(name: "your_cool_project", dependencies: ["Spinner"])
```



## Getting Started

To create a spinner for `2` seconds:

``` swift
import Foundation
import Spinner

let mySpinner = Spinner(.dots, "My Spinner")
mySpinner.start()
sleep(2) // do work
mySpinner.stop()
```

## Documentation

#### Creating a Spinner

To create a spinner, initialize an instance of the `Spinner` class. The initializer takes the following arguments:

- `pattern: SpinnerPattern` The pattern that the spinner will display
- `text: String` The text that will be displayed next to the spinner
- `speed: Double` The speed the animation
- `color: Color` The color of the spinner
- `format: String` The format of the spinner

``` swift
let mySpinner = Spinner(.dots, "My Spinner", speed: 0.5, color: .lightMagenta, format : "{S} {T}")
```
#### Starting the Spinner
To start a spinner call the `.start()` function. This will hide the curser and start the animation of the pattern.
``` swift
mySpinner.start()
```
#### Updating Properties
While the spinner is still going you may want to update its properties. to do this call one of the update functions.
- `.updatePattern(SpinnerPattern)` Updates the pattern that is animated over
- `.updateText(String)` Updates the text displayed next to the spinner
- `.updateSpeed(Double)` Updates the animation speed
- `.updateColor(Color)` Updates the colors of the animated pattern
- `.updateFormat(String)` Updates the format of the spinner
#### Stopping the Spinner
To stop a spinner from animating call the `.stop()` function on its instance, this will stop the animation on the current frame, return to a new line along with re-enabling the curser. The `.stop()` function also takes arguments to allow for a final update of the spinner, this can be extremely usefully: 
- `finalFrame: String` The final frame the Spinner will display
- `text: String` The text displayed by the Spinner once stopped
- `color: Color` The color the Spinner will display the pattern in
- `terminator: String` The termination string passed to the final print function - default is "\n" for a new line
``` swift
mySpinner.stop(finalFrame: "!", text: "Final Text", .cyan, terminator: "\n")
``` 
#### Clear
To stop the spinner and clear it at the same time call the `.clear()` function.
``` swift
mySpinner.clear()
```
#### Completion Types
Four completion types have been built to display extra useful information to the user. Pass a string to the completion type to change the text of the stopped spinner. 
- `.succeed()` A green tick is displayed
- `.failure()` A red cross is displayed
- `.warning()` A yellow warning triangle sign is displayed 
- `.information()` A blue information sign is displayed
``` swift
mySpinner.succeed("Passed")
```
<p align="center">
	<br>
	<img src="https://raw.githubusercontent.com/dominicegginton/Spinner/master/Assets/completion_types.gif">
	<br>
	<br>
</p>

#### Spinner Format

The spinner object has a default format of `{S} {T}`, this renders the animated pattern before the text with a space between. By passing a string with a new format to the initializer or calling `.updateFormat(String)` you can use a custom format. Any String character can be used within the format string and will be permanently rendered, only the following will be replaced:
- `{S}` Renders the animated pattern
- `{T}` Renders the text
- `{D}` Renders the duration of the spinner
``` swift
let mySpinner = Spinner(.dots, "My Spinner", format : "{T} - {S}")
```
<p align="center">
	<br>
	<img src="https://raw.githubusercontent.com/dominicegginton/Spinner/master/Assets/format.gif">
	<br>
	<br>
</p>

#### Adding a Spinner Timer

To add a timer to the spinner you need to add the duration string `{D}` to the spinner formation:
```swift
let mySpinner = Spinner(.dots, "My Spinner", format: "[{D}] {T} - {S}") // [8s] ⠧ My Spinner
```

#### Creating Custom Patterns
We have **60** animated spinner patterns, however to create your own, define a new `SpinnerPattern(multiFrame: [String])`. The default speed for multi frame patterns is 0.08, to change this pass a double into the spinner initializer.
``` swift
let customPattern = SpinnerPattern(multiFrame: ["1","2","3","4","5"])
let mySpinner = Spinner(customPattern, "My Spinner", speed: 0.3)
```
<p align="center">
	<br>
	<img src="https://raw.githubusercontent.com/dominicegginton/Spinner/master/Assets/custom_pattern.gif">
	<br>
	<br>
</p>

## Community

Many thanks for the **60 plus** spinner frames that can be found over at [sindresorhus/cli-spinners](https://github.com/sindresorhus/cli-spinners) repo built in `JavaScript`.
