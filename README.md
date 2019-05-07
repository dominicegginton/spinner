# Swift CLI Spinners

TODO: project test pass/fail icons 

Taking [inspiration](## Community) from others in the GitHub community, Spinner aims to fix core issues and expand on functionality, giving developers a stable, fast and easy way of creating spinning animations for there CLI applications.

TODO: gif image

## Install 

When developing with swift for cross platforms applications you will want to use the [**Swift Package Manger**](https://swift.org/package-manager/). Just add the github url of this repo to your `Package.swift` file to create a depenacy. 
``` swift
// swift-tools-version:4

import PackageDescription

let package = Package(
    name: "YourAmazingSoftware",
    dependencies: [
        package(url: "https://github.com/dominicegginton/Spinner", from: "0.1.0")
    ]
)
```
Running `swift build` will install and complie everything for you 💪

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

## Contributing

TODO:
- issues
- pull requests

## Community

TODO:
- dependacy 
- inspriation
- Used by