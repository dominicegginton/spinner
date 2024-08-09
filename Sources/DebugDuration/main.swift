import Spinner
import Foundation

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

let message = "duration debugging - running sleep cmd"

let spinner = Spinner(.dots, message, format: "{S} {T} ⏱️ {D}")
spinner.start()
shell("sleep", "10") // do work
spinner.stop()
