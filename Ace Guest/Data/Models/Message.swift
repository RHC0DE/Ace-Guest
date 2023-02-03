//
//  Ace Guest
//

import Foundation

struct Message: Identifiable {
    
    var id: String
    var messageTitle: String
    var messageSendByUser: String
    var hasAttachment: Bool
    
    // Is overbodig, haal weg
    var dateMessageEvent: Date
    var dateMessageString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM"
        return formatter.string(from: dateMessageEvent)
    }
    
}
