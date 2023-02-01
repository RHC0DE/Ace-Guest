//
//  Ace Guest
//

import Foundation

struct Appointment {
    
    var uid: String
    var startDate: Date
    var endDate: Date
    var email: String
    var accessCode: String
    var startDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM yyyy HH:mm "
        return formatter.string(from: startDate)
    }
    var endDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM yyyy HH:mm"
        return formatter.string(from: endDate)
    }
    
    var appointmentMessageString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM"
        return formatter.string(from: startDate)
    }
    
}
