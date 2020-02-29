import Foundation
import Spinner
import Rainbow

let mySpinner = Spinner(.dots, "My Spinner", color: .blue)
mySpinner.start()
sleep(2)
mySpinner.stop()
