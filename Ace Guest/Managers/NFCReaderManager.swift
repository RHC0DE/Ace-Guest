//
//  NFCReaderManager.swift
//  Ace Guest
//

import Foundation
import SwiftUI
import CoreNFC

class NFCReaderManager : NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {

    @ObservedObject var viewModel = AppointmentViewModel()
    var accessCode = ""
    var nfcSession: NFCNDEFReaderSession?
    
    /**
     * The function scan() handles anything related to the NFCReader class it writes the value of the accessCode to the NFC tag.
     */
    func scan(accessCode: String) {
        
        self.accessCode = accessCode
        self.nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        self.nfcSession?.alertMessage = Strings.phoneNearReader
        self.nfcSession?.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
    }
    
    /**
     * This function handles the reading and writing of NFC tags
     */
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        
        let string: String = self.accessCode
        let oneTag: Int = 1
        
        // If the appication detects more then one tag it shows a alert and pause the scanning session.
        if tags.count > oneTag {
            let retryInterval = DispatchTimeInterval.milliseconds(500)
            session.alertMessage = Strings.moreThenOneTag
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval, execute: {
                session.restartPolling()
            })
            return
        }
        
        // If the app scans a single tag it will try to connect
        let tag = tags.first!
        session.connect(to: tag, completionHandler: {(error: Error?) in
            
            // if there is occuring an error while connecting then it wil show a alert
            if nil != error {
                session.alertMessage = Strings.unableToConnect
                session.invalidate() // Stops the session
                return
            }
            
            tag.queryNDEFStatus(completionHandler: {(ndefstatus: NFCNDEFStatus, capacity: Int, error: Error?) in
                guard error == nil  else {
                    session.alertMessage = Strings.unableToConnect
                    session.invalidate()
                    return
                    
                }
                
                // Handling all possible errors incase there are diffrent reasons why the tag can't connect
                switch ndefstatus{
                    
                case .notSupported:
                    session.alertMessage = Strings.notSupported
                    session.invalidate()
                    
                case .readOnly:
                    session.alertMessage = Strings.readNDEFFailed
                    session.invalidate()
                    
                case .readWrite:
                    tag.writeNDEF(.init(records: [NFCNDEFPayload.wellKnownTypeURIPayload(string: " the Access Code: \(string)")!]), completionHandler: {(error: Error?) in
                        
                        if nil != error{
                            session.alertMessage = Strings.writeNDEFFailed
                        } else {
                            session.alertMessage = Strings.succesfullyScannedReader
                            NotificationManager.instance.scheduleNotification()
                            NotificationManager.instance.sendMessageTouser(to: Strings.deviceToken, title: "\(self.viewModel.guestAppointment?.email ?? "") is in the Club Ace building!", body: "For the meeting of \(self.viewModel.guestAppointment?.startDateString ?? "") till \(self.viewModel.guestAppointment?.endDateString ?? "")")
                        }
                        session.invalidate()
                        
                    })
                    
                @unknown default:
                    session.alertMessage = Strings.unknowError
                    session.invalidate()
                    
                }
                
            })
            
        })
        
    }
    
}
