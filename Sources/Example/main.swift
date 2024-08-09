import Foundation
import Spinner

let spinner = Spinner(.dots, "foo bar baz")
spinner.start()
sleep(2) // do work
spinner.stop()
