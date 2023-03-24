//
//  Ace Guest
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseAnalytics
import FirebaseFirestore
import FirebaseStorage
import FirebaseMessaging
import UserNotifications

@main
struct Ace_GuestApp: App {
    @AppStorage("isOnBoaring") var isOnBoaring = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    //    init() {
    //        FirebaseApp.configure()
    //    }
    var body: some Scene {
        
        WindowGroup {
            
            let viewModel = AppointmentViewModel()
            
            if isOnBoaring {
                
                LandingPageView()
                
            } else {
                
                ContentView()
                    .environmentObject(viewModel)
                
            }
            
        }
        
    }
}

    class AppDelegate: NSObject, UIApplicationDelegate {
        let gcmMessageIDKey = "gcm.message_id"
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            
            Messaging.messaging().delegate = self
            
            if #available(iOS 10.0, *) {
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.current().delegate = self
                
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: {_, _ in })
            } else {
                let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
            
            application.registerForRemoteNotifications()
            return true
        }
        
        func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                         fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID: \(messageID)")
            }
            
            print(userInfo)
            
            completionHandler(UIBackgroundFetchResult.newData)
        }
    }
    
    extension AppDelegate: MessagingDelegate {
        func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
            
            let deviceToken:[String: String] = ["token": fcmToken ?? ""]
            print("Device token: ", deviceToken)
        }
    }
    
    @available(iOS 10, *)
    extension AppDelegate : UNUserNotificationCenterDelegate {
        
        // Receive displayed notifications for iOS 10 devices.
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            let userInfo = notification.request.content.userInfo
            
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID: \(messageID)")
            }
            
            print(userInfo)
            
            // Change this to your preferred presentation option
            completionHandler([[.banner, .badge, .sound]])
        }
        
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            
            print("didRegisterForRemoteNotificationsWithDeviceToken")
        }
        
        func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("didRegisterForRemoteNotificationsWithDeviceToken")
        }
        
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
            let userInfo = response.notification.request.content.userInfo
            
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID from userNotificationCenter didReceive: \(messageID)")
            }
            
            print(userInfo)
            
            completionHandler()
        }
    }
