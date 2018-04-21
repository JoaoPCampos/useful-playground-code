# Couple of playground files with useful stuff

Help yourself by using some of these implementations in your code. Pretty simple stuff that a lot of people search for when writting code.

## Table of contents

[#1 Date Extension](https://github.com/JoaoPCampos/useful-playground-code#1-date-extension)
[#2 String Extension](https://github.com/JoaoPCampos/useful-playground-code#2-string-extension)
[#3 NSMutableAttributedString Extension](https://github.com/JoaoPCampos/useful-playground-code#3-NSMutableAttributedString-extension)
[#4 First Class Functions](https://github.com/JoaoPCampos/useful-playground-code#4-first-class-functions)



## [#1 Date Extension]
Convert date to string using specified format represented by the enum DateFormatType

```swift
enum DateFormatType: String {
case ddMMyyy = "dd/MM/yyyy"
}

extension Date {
func toString(withFormat format: DateFormatType) -> String {
let dateFormatter = DateFormatter()
dateFormatter.locale = Locale.current
dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
dateFormatter.dateFormat = format.rawValue
return dateFormatter.string(from: self)
}
}

//testing
print(Date().toString(withFormat: .ddMMyyy))
```

## [#2 String Extension]
Convert string to date, from a specific date format represented by the enum DateFormatType

```swift
enum DateFormatType: String {
case ddMMyyy = "dd/MM/yyyy"
}

extension String {
func toDate(withFormat format: DateFormatType) -> Date? {
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = format.rawValue
dateFormatter.locale = Locale.current
return dateFormatter.date(from:self)
}
}

//testing
if let date = "01/01/2000".toDate(withFormat: .ddMMyyy) {
print(date)
}
```

## [#3 NSMutableAttributedString Extension]
Less painfull way to create an attributed string, add color and/or font to any substring too.

```swift
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
```

## [#4 First Class Functions]
Seems a good approach to try out soon...

```swift
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
```
