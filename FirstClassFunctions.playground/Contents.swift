//j0cs 2018
import UIKit

class HeaderView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(font: UIFont, textColor: UIColor) {
        super.init(frame: CGRect.zero)
        print("HeaderView with font and color")
    }
}

class PromotionView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(font: UIFont, textColor: UIColor) {
        super.init(frame: CGRect.zero)
        print("PromotionView with font and color")
    }
}

class ProfileView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(font: UIFont, textColor: UIColor) {
        super.init(frame: CGRect.zero)
        print("ProfileView with font and color")
    }
}

func call<Input, Output>(_ function: (Input) -> Output, with input: Input) -> Output {
    return function(input)
}

//testing
let styles = (UIFont.systemFont(ofSize: 20), UIColor.red)

let headerView = call(HeaderView.init, with: styles)
let promotionView = call(PromotionView.init, with: styles)
let profileView = call(ProfileView.init, with: styles)


