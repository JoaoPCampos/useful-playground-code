//j0cs 2018
import Foundation

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
