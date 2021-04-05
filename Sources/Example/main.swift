import Foundation
import Spinner

let mySpinner = Spinner(.dots, "My Spinner", format: "[{D}] {S} - {T}")
mySpinner.start()
sleep(5) // do work
mySpinner.succeed()