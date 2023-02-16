//
//  Ace Guest
//

import Combine
import Firebase
import FirebaseFirestore
import FirebaseStorage
import Foundation
import SwiftUI

enum RegisterGuest {
    case empty
    case valid
    case invalid
}

class AppointmentViewModel: ObservableObject {
    
    // MARK: - Variabels
    
    // Apppointment object
    @Published var appointments : [Appointment] = []
    @Published var guestAppointment: Appointment?
    
    // User email
    @Published var email = ""
    @Published var emailErrorMessage = ""
    let emailValidRegEx = Strings.eMailValidatorRegEx

    //Guest accescode
    @Published var accessCode = ""
    @Published var accessCodelength = 6
    @Published var accessCodeErrorMessage = ""
    let pasteboard = UIPasteboard.general
    
    // Login booleans
    @Published var isValid = false
    @Published var invalidAttempts = 0
    @Published var showMaxAttemptsReachedAlert = false
    @Published var isDisabled = false
    @Published var accessPasIsRegistered = false
    @Published var shouldShowLogOutOptions = false
    
    // Login timer
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var time = 10
        
    // Accesspass colors
    @Published var colorOne = Color(.black)
    @Published var colorTwo = Color(.white)
    
    // Accesspass booleans
    @Published var hide = false
    @Published var showSettings = false
    @Published var shouldShowSuccesRegisterAlert = false
    
    // Date data
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var dateErrorMessage = ""
    
    @Published var appointmentStatusMessage = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    // MARK: - Combine variabels
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isEmailValid: AnyPublisher<Bool, Never> {
        self.$email
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                email in
                return self.emailValidRegEx.evaluate(with: email)
            }
            .eraseToAnyPublisher()
        
    }
    
    private var isEmailEmptyPublisher: AnyPublisher<Bool, Never> {
        self.$email
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { email in
                return email == ""
            }
            .eraseToAnyPublisher()
    }
    
    private var isAccessCodeEmptyPublisher: AnyPublisher<Bool, Never> {
        self.$accessCode
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { accessCode in
                return accessCode == ""
            }
            .eraseToAnyPublisher()
    }
    
    private var isEmailValidPublisher: AnyPublisher<RegisterGuest, Never> {
        
        Publishers.CombineLatest(isEmailValid, isEmailEmptyPublisher)
            .map { isEmailValid, eMailIsEmpty in
                
                if(eMailIsEmpty) {
                    return .empty
                }
                
                else if (!isEmailValid) {
                    return .invalid
                }
                
                else {
                    return .valid
                }
                
            }
            .eraseToAnyPublisher()
    }
    
    private var isAccessCodeSixCharacterPublisher: AnyPublisher<Bool, Never> {
        self.$accessCode
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { accessCodeInput in
                return accessCodeInput.count < self.accessCodelength || accessCodeInput.count > self.accessCodelength
            }
            .eraseToAnyPublisher()
    }
    
    private var isAccessCodeValidPublisher: AnyPublisher<RegisterGuest, Never> {
        
        Publishers.CombineLatest(isAccessCodeSixCharacterPublisher, isAccessCodeEmptyPublisher)
        
            .map { accessCodeSixCharacter, passwordIsEmpty  in
                
                if(passwordIsEmpty) {
                    return .empty
                }
                
                else if (accessCodeSixCharacter) {
                    return .invalid
                }
                
                else {
                    return .valid
                }
                
            }
            .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isAccessCodeValidPublisher)
            .map { emailIsValid, passwordIsValid in
                return emailIsValid == .valid && passwordIsValid == .valid
                
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Constructors
    
    init() {
                              
        isEmailValidPublisher
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { emailCheck in
                switch emailCheck {
                case .empty:
                    return "E-mail can't be empty"
                    
                case .invalid:
                    return "E-mail is not valid"
                    
                default:
                    return ""
                }
                
            }
            .assign(to: \.emailErrorMessage, on: self)
            .store(in: &cancellableSet)
        
        isAccessCodeValidPublisher
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { passwordCheck in
                switch passwordCheck {
                case .empty:
                    return "Access code can't be empty"
                case .invalid:
                    return "access code has to be six characters"
                default:
                    return ""
                }
                
            }
            .assign(to: \.accessCodeErrorMessage, on: self)
            .store(in: &cancellableSet)
        
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
    
    // MARK: - Firestore
    
    
    func fetchCurrentAppointment() {
        
        guard let uid =
                FirebaseManager.shared.auth.currentUser?.uid
        else {
            self.appointmentStatusMessage = "Loading data of current user.....!"
            return
        }

        FirebaseManager.shared.fireStore.collection("Appointments")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.appointmentStatusMessage = "Failed to fetch current appointment: \(error)"
                    print("Failed to fetch current appointment", error)
                    return
                }

                guard let data = snapshot?.data() else {
                    self.appointmentStatusMessage = "No data found"

                    return

                }

                self.appointmentStatusMessage = "Data: \(data.description)"

                let uid = data["uid"] as? String ?? ""
                let startDate = (data["startDate"] as? Timestamp)?.dateValue() ?? Date()
                let endDate = (data["endDate"] as? Timestamp)?.dateValue() ?? Date()
                let email = data["email"] as? String ?? ""
                let accessCode = data["accessCode"] as? String ?? ""

                self.guestAppointment = Appointment(uid: uid, startDate: startDate, endDate: endDate, email: email, accessCode: accessCode)
            }
        
    }
    
    func loginGuest() {
        Auth.auth().signIn(withEmail: email, password: accessCode) { result, error in

            if let error = error {
                print("Failed to login user: \(error)")
                self.appointmentStatusMessage = "Failed to login! Please enter the correct email/password..."

            return
                
            }
                        
            print("Succesfully logged in as user: \(result?.user.uid ?? "")")
        }
        
    }
    
    func signOutGuest() {
        try? Auth.auth().signOut()

        self.accessPasIsRegistered = false
        print("Succesfully logged out the current user")

    }
    
    
    func registerGuest() {
        Auth.auth().createUser(withEmail: email, password: accessCode) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            self.addAppointmentData()
        }
    }
    
    func addAppointmentData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let guestData = ["startDate": self.startDate, "endDate": self.endDate, "email": self.email, "accessCode": self.accessCode, "uid": uid] as [String : Any]
        Firestore.firestore().collection("Appointments")
            .document(uid).setData(guestData) { error in
                if let error = error {
                    print(error)
                    return
                }
                
                print("Succes")
            }
    }

    // MARK: - Functions
    
    func createPassword() {
        let numbers = Strings.oneToTen
        var newPassword = ""
        
        for _ in 0..<accessCodelength {
            let randomChar = numbers.randomElement()!
            newPassword += String(randomChar)
        }
        
        self.accessCode = newPassword
        
    }
        
    func invalidAttemptsToLogin() {
        let attempt = 1
        let maxAttempt = 4
        
        if self.invalidAttempts < maxAttempt {
            self.invalidAttempts += attempt
            
        } else {
            self.isDisabled.toggle()
            self.showMaxAttemptsReachedAlert.toggle()
        }
        
    }
    
    func loginTimeout() {
        if self.isDisabled {
            self.time -= 1
            print(self.time)
            if self.time == 0 {
                self.time = 10
                self.isDisabled.toggle()
            }
        }
    }

    func copyToClipBoard() {
        pasteboard.string = self.accessCode
    }
}
