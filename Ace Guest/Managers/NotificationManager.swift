//
//  Ace Guest
//

import Foundation
import UserNotifications


/**
 Creates an In App Notification
 */
class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
      
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner, .sound])
    }
}


/**
 Creates a Notification
 */
class NotificationManager {
    
    static let instance = NotificationManager()
        
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = Strings.welcomeNotificationTitle
        content.subtitle = Strings.welcomeNotificationSubTitle
        content.sound = .default
        
        // Time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    /**
     Creates a remote notification sended to the user with who the guest has an apointment
     */
    func sendMessageTouser(to token: String, title: String, body: String) {
           print("sendMessageTouser()")
        let urlString = Strings.URL
           let url = NSURL(string: urlString)!
           let paramString: [String : Any] = ["to" : token,
                                              "notification" : ["title" : title, "body" : body],
                                              "data" : ["user" : "test_id"]
           ]
        
        let serverkey = Strings.serverKey
           let request = NSMutableURLRequest(url: url as URL)
           request.httpMethod = "POST"
           request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.setValue("key=\(serverkey)", forHTTPHeaderField: "Authorization")
           let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
               do {
                   if let jsonData = data {
                       if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                           NSLog("Received data:\n\(jsonDataDict))")
                       }
                   }
               } catch let err as NSError {
                   print(err.debugDescription)
               }
           }
           task.resume()
       }
    
}
