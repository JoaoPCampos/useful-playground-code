//j0Cs 2018
import UIKit

extension Optional {
    func calledBy(_ callback: (Wrapped) -> Void, orFallsbackTo fallBack: (() -> Void)? = nil) {
        guard let unwrapped = self else {
            fallBack?()
            return
        }
        callback(unwrapped)
    }
}

func callee(str: String) {
    print(str.uppercased())
}


//testing
var myOptional: String?

let fallBack: () -> Void = { print("myOptional is nil") }

myOptional.calledBy(callee) //does nothing
myOptional.calledBy(callee, orFallsbackTo: fallBack) //calls fallBack

myOptional = "\nstring to uppercase"
myOptional.calledBy(callee) //calls callee
