//
//  Ace Guest
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

class MessagesViewModel : ObservableObject {
    
    // Object variables
    @Published var messages : [Message] = []
    @Published var message : Message?
    
    @Published var statusMessage = ""
        
    init() {
        fetchMessage()
        fetchMessages()
    }
    
    func fetchMessage() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
                
        else {
            self.statusMessage = "Loading messages of current user.....!"
            return
        }
        
        FirebaseManager.shared.fireStore.collection("Messages")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.statusMessage = "Failed to fetch current message: \(error)"
                    print("Failed to fetch current appointment", error)
                    return
                }
                
                guard let data = snapshot?.data() else {
                    self.statusMessage = "No data found"
                    
                    return
                    
                }
                
                let uid = data["id"] as? String ?? ""
                let messageTitle = data["messageTitle"] as? String ?? ""
                let messageSendByUser = data["messageSendByUser"] as? String ?? ""
                let hasAttachment = data["hasAttachment"] as? Bool ?? Bool()
                let dateMessageEvent = (data["dateMessageEvent"] as? Timestamp)?.dateValue() ?? Date()
                self.message = Message(id: uid, messageTitle: messageTitle, messageSendByUser: messageSendByUser, hasAttachment: hasAttachment, dateMessageEvent: dateMessageEvent)
                
            }
        
    }
    
    func fetchMessages() {
        messages.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Messages")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let uid = data["id"] as? String ?? ""
                    let messageTitle = data["messageTitle"] as? String ?? ""
                    let messageSendByUser = data["messageSendByUser"] as? String ?? ""
                    let hasAttachment = data["hasAttachment"] as? Bool ?? Bool()
                    let dateMessageEvent = (data["dateMessageEvent"] as? Timestamp)?.dateValue() ?? Date()
                    
                    let message = Message(id: uid, messageTitle: messageTitle, messageSendByUser: messageSendByUser, hasAttachment: hasAttachment, dateMessageEvent: dateMessageEvent)
                    self.messages.append(message)
                }
                
            }
            
        }
    }
    
}
