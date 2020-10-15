import UIKit
import Combine

let map = Just(3).map { "\($0)" }
let flatmap = Just(3).flatMap { Just("\($0)") }
let compactmap = Just([1, 2, 3]).compactMap { return $0 }


