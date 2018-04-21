//j0cs 2018
import UIKit

extension NSMutableAttributedString {

    func add(attributes: [NSAttributedStringKey : Any], toSubString subStr: String) -> NSMutableAttributedString {
        guard let range = string.range(of: subStr) else {
            print("SUBSTRING \"\(subStr)\" NOT FOUND")
            return self
        }
        self.addAttributes(attributes, range: NSRange(range, in: self.string))
        return self
    }

    func add(fontAttribute font: UIFont? = nil, colorAttribute color: UIColor? = nil, toSubString subStr: String) {
        let subStrRange = rangeOfSubString(subStr: subStr)
        if let font = font {
            self.addAttributes([NSAttributedStringKey.font: font], range: subStrRange)
        }
        if let color = color {
            self.addAttributes([NSAttributedStringKey.foregroundColor: color], range: subStrRange)
        }
    }

    fileprivate func rangeOfSubString(subStr: String) -> NSRange {
        guard let range = string.range(of: subStr) else {
            print("SUBSTRING \"\(subStr)\" NOT FOUND")
            return NSRange(location: 0, length: 0)
        }
        return NSRange(range, in: self.string)
    }

//    func add(fontAttribute font: UIFont? = nil, colorAttribute color: UIColor? = nil, toSubString subStr: String) {
//        let subStrRange = rangeOfSubString(subStr: subStr)
//        if let font = font {
//            self.addAttributes([NSFontAttributeName: font], range: subStrRange)
//        }
//        if let color = color {
//            self.addAttributes([NSForegroundColorAttributeName: color], range: subStrRange)
//        }
//    }
}

//testing
let multiColors = NSMutableAttributedString(string: "Color 1 and Color 2 Bold")

multiColors.add(colorAttribute: .white, toSubString: "Color 1 and Color 2 Bold") // all white
multiColors.add(attributes: [NSAttributedStringKey.foregroundColor: UIColor.red], toSubString: "Color 1") //Color 1 red rest is white
multiColors.add(attributes: [NSAttributedStringKey.foregroundColor: UIColor.green], toSubString: "Color 2") //Color 1 red, Color 2 green rest is white
multiColors.add(fontAttribute: UIFont.boldSystemFont(ofSize: 30), toSubString: "Bold") // Bold word is now bold and size 30

