# Spinner

![carbon (3)](https://user-images.githubusercontent.com/28626241/160242315-a4f8a928-1f7d-45f0-937d-0e33f549735f.svg)

- Over **80** built-in spinner patterns
- Create custom spinners patterns
- Customise the spinners format
- Handy built-in completion functions (success, error, warning, info)
- Time your spinner and display its duration
- Apply colors with the use of [rainbow](https://github.com/onevcat/Rainbow)
- Use a custom `SpinnerStream` for output

## Install

Install via the [**Swift Package Manger**](https://swift.org/package-manager/) by declaring **Spinner** as a dependency in your projects `Package.swift`:

``` swift
.package(url: "https://github.com/dominicegginton/Spinner", from: "1.0.0")
```


## Getting Started

``` swift
import Foundation
import Spinner

let spinner = Spinner(.dots, "foo bar baz")
spinner.start()
sleep(2) // do work
spinner.stop()
```

## Documentation

#### Creating a spinner

Create a **spinner** by initializing an instance of the `Spinner` class. 

``` swift
let spinner = Spinner(.dots, "foo bar baz")
```

The `Spinner()` class ins accepts optional arguments that customise the spinner.

``` swift
/**
Initialize spinner
- Parameter pattern: spinner pattern
- Parameter message: message to render
- Parameter color: spinner pattern color
- Parameter speed: speed of spinner animation
- Parameter format: spinner format
- Parameter stream: output steam for spinner
- Parameter signal: signal trap implementation for spinner
*/
public init(_ pattern: SpinnerPattern, _ message: String = "", color: Color = .default, speed: Double? = nil, format: String = "{S} {T}", stream: SpinnerStream? = nil, signal: SpinnerSignal? = nil)
```

#### Start the spinner

Call the `Spinner.start()` function to start the spinner animation. This will also call the `SpinnerStream.hideCursor()` function to hide the cursor.

``` swift
let spinner = Spinner(.dots, "foo bar baz")
spinner.start()
```

#### Stop the spinner

Call the `Spinner.stop()` function to stop the spinner animation. This will also call the `SpinnerStream.showCursor()` function to show the cursor.

``` swift
let spinner = Spinner(.dots, "foo bar baz")
spinner.stop()
```

The `Spinner.stop()` function accepts optional arguments that customise its behaviour.

``` swift
/**
Stop the spinner
- Parameter frame: final frame to render before stopping
- Parameter message: final message to render before stopping
- Parameter color: final frame color
- Parameter terminator: the string to print after all items have been printed
*/
public func stop(frame: String? = nil, message: String? = nil, color: Color? = nil, terminator: String = "\n")
```

#### Clear the spinner

The `Spinner.clear()` function is a helper function that stops and clears the spinner. Its implementation uses `Spinner.stop()` under the hood.

``` swift
let spinner = Spinner(.dots, "foo bar baz")
spinner.clear()
```

#### Helper functions

Helper functions that implement `Spinner.stop()` under the hood are provided for common tasks.

``` swift
/**
Stop and clear the spinner
*/
public func clear()

/**
Stop and render a green tick for the final pattern frame
- Parameter message: spinner message to render
*/
public func success(_ message: String? = nil)
    
/**
Stop and render a red cross for the final pattern frame
- Parameter message: spinner message to render
*/
public func error(_ message: String? = nil)
    
/**
Stop and render a yellow warning symbol for the final pattern frame
- Parameter message: spinner message to render
*/
public func warning(_ message: String? = nil)
    
/**
Stop and render a blue information sign  for the final pattern frame
- Parameter message: spinner message to render
*/
public func info(_ message: String? = nil)
```

#### Updating the spinner while animating

Functions are provided to update the spinner while animating.

``` swift
/**
Update spinner pattern
- Parameter pattern: spinner pattern
*/
public func pattern(_ pattern: SpinnerPattern)
    
/**
Update spinner message
- Parameter message: message to render
*/
public func message(_ message: String)
    
/**
Update spinner animation speed
- Parameter speed: speed of spinner animation
*/
public func speed(_ speed: Double)
    
/**
Update spinner pattern color
- Parameter color: spinner pattern color
*/
public func color(_ color: Color)
    
/**
Update spinner format
- Parameter format: spinner format
*/
public func format(_ format: String)
```

#### Spinner patterns


#### Customise the spinner render format

To the spinner the `Spinner.format` string is taken as a base and occurrences of keys are replaced to generate the rendered spinner.

- `{S}` renders the animated pattern
- `{T}` renders the message
- `{D}` renders the duration of since starting the spinner

``` swift
let spinner = Spinner(.dots, "foo bar baz", format : "{T} - {S}") // foo bar baz - ⠧
```

#### Timing the spinners duration

Use a custom `Spinner.format` string that includes `{D}` in order to render the duration of time since starting the spinner animation

```swift
let spinner = Spinner(.dots, "foo bar baz", format: "{D} {T} - {S}") // 8s ⠧ foo bar baz
```

#### Creating Custom Patterns

The `SpinnerPattern()` enum initializer to create a **spinner** pattern with an array of strings.

``` swift
let pattern = SpinnerPattern(frames: ["1","2","3","4","5"])
let spinner = Spinner(pattern, "foo bar baz", speed: 0.3) // 1 foo bar baz
```

#### CustomStreams

**Spinner** wraps output logic in a `SpinnerStream` protocol. This library provides the `StdOutSpinnerStream` class that implements to writing to **STDOUT**.

``` swift
struct SwiftCLISpinnerStream: SpinnerStream {
    private let _stdout: WritableStream
  
    init(stdout: WritableStream) {
        _stdout = stdout
    }

    func write(string: String, terminator: String) {
        _stdout.write(string, terminator: terminator)
    }

    func hideCursor() {
        _stdout.write("\u{001B}[?25l", terminator: "")
    }

    func showCursor() {
        _stdout.write("\u{001B}[?25h", terminator: "")
    }
}

let spinner = Spinner(.dots, "foo bar baz", stream: SwiftCLISpinnerStream(stdout: stdout))
```

#### Caveat

In order to handle process interrupts (for example, SIGINT through <kbd>ctrl</kbd>+<kbd>c</kbd>) a signal handler is used to show the user's cursor before exiting. This library provides a `SpinnerSignal` protocol and a `DefaultSpinnerSignal` structure that handles this functionality by default. If this conflicts with other signals in use, a custom implementation of `SpinnerSignal` can be provided. See [IBM-Swift/BlueSignals](https://github.com/IBM-Swift/BlueSignals) for a clean and safe way of handling signals. The appropriate signal handler for your project could look something like:

``` swift
struct CustomSpinnerSignal: SpinnerSignal {
    func trap() {
        Signals.trap(signal: .int) { _ in
            // print("\u{001B}[?25h", terminator: "")
            // exit(0)
        }
    }
}

let spinner = Spinner(.dots, "foo bar baz", signal: CustomSpinnerSignal())
```
