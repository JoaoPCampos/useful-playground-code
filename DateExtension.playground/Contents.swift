//j0cs 2018
import Foundation

enum DateFormatType: String {
    
    case ddMMyyy = "dd/MM/yyyy"
}

extension Date {
    
    func toString(withFormat format: DateFormatType) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.string(from: self)
    }
}

//testing
print(Date().toString(withFormat: .ddMMyyy))
