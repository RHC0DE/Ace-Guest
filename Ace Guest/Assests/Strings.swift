//
//  Ace Guest
//

import Foundation

struct Strings {
    
    // MARK: - Login Page
    static let registerTitle = "Register your access pass."
    static let register = "Register"
    static let noAccesCode = "Didn't receive a HID Mobile Access invitation code?"
    static let contact = "Please contact reception"
    static let linkTel = "tel:0202184757"
    static let alertFailedAccessTitle = "Failed access pass registration"
    static let alertFailedAccessBody = "The Access is temporarily disabled due to many failed login attempts. Please try again in 5 minutes or consult the reception"
    static let alertFailedLoginBody = "The entered access code is not correct, please check"
    static let ok = "Ok"
    
    // MARK: - Register Page
    static let contactRegister = "\nPlease contact the reception for registration changes"
    static let linkMail = "hello@thisisace.nl"
    
    // MARK: - Landing Page
    static let landingTitle = "Welcome \nto Club Ace!"
    static let landingBody = "Go through this quick setup to get the most out of this app."
    static let letsGo = "Let's go!"
    
    // MARK: - OnBoarding Page
    static let notificationOnBoardingTitle = "When entering the Club Ace office, important messages are sent, such as the status updates of your current appointment!"
    static let nfcOnBoardingTitle = "NFC is used to open the doors of the Club Ace office!"
    static let next = "Next"
    static let getStarted = "Get started"
    static let accepted = "Accept"
    
    // MARK: - CardView Page
    static let accessPassTitle = "Access pass"
    static let amsterdam = "Amsterdam"
    static let hiddenAccessCode =  "xxxxxx"
    static let scanner = "Scan"

    // MARK: - Terms And Conditions Page
    static let ourConditionsTitle = "Our conditions"
    static let termsAndConditionsBody = "Read and accept the terms before you can get started with your account."
    static let iAgreeTermsAndConditions = "I agree with the "
    static let termsAndConditions = "Terms and Conditions"
    static let termsAndConditionsLink = "https://www.thisisace.nl/en/terms-conditions"
    static let iAgreePrivacyPolicy = "I agree to it "
    static let privacyPolicy = "privacy policy"
    static let privacyPolicyLink = "https://club-ace-test.s3.eu-central-1.amazonaws.com/static/pdf/Privacy+Policy.pdf"
    static let errorMessageTermsAndConditions = "You must accept both the terms and conditions and the privacy policy to continue."
    
    // MARK: -  Settings Page
    static let messageHeader = "Messages"
    static let settingsHeader = "Settings"
    static let personalDetailHeader = "Personal details"
    static let aboutHeader = "About the app"
    static let logout = "Log out"
    static let popUpProfileTitle = "Profile settings"
    static let popUpProfileBody = "Are you sure you want to log out?"
    static let close = "Close"
    
    // MARK: - Messages Page
    static let welcomeMessage = "Welcome in Club Ace!"
    static let aceMessageHeaderText = "Ace"
    static let messageBody =  "The employee has been notified of your arrival and will be there as soon as possible. In the meantime, please see the link attached if interested in a snack or drink. \n\nHave a great day and thanks for using the Ace Guest app! \n\nSincerely, \n\nThe Ace Family"
    static let attachment = "Attachment"
    static let attechmentLink = "https://docs.google.com/document/d/18-Ly8AFdIwZwlZMZKNf7z_SDYx7zAuIagTvVCV0BV1o/edit?usp=sharing"
    static let couponText = "coupons.doc"

    // MARK: - App Settings Page
    static let appSettingsHeaderText = "App settings"
    static let pushNotifications = "Push notifications"
    static let couponDocText = "coupons.doc"
    static let englishHeader = "Dutch"
    
    // MARK: - Personal Details Page
    static let personalDetailsHeader = "Personal details"
    static let emailAdress = "Email address"
    static let startDateAndTime = "Start date/time"
    static let endDateAndTime = "End date/time"

    // MARK: - NFC Page
    static let phoneNearReader = "Hold your iPhone near the Club Ace door reader"
    static let moreThenOneTag = "More then one Tag Detected, please try again"
    static let unableToConnect = "Unable to connect to Tag"
    static let notSupported = "Not supported, unable to connect to Tag"
    static let readNDEFFailed = "Read NDEF message Failed"
    static let writeNDEFFailed = "Write NDEF message Failed"
    static let succesfullyScannedReader = "You have succesfully scanned the Club Ace door reader!"
    static let unknowError = "Unknow error"
    
    // MARK: - Notification's
    static let welcomeNotificationTitle = "Welcome in the Club Ace building!"
    static let welcomeNotificationSubTitle = "The employee will be informed of your arival as soon as possible"
    static let URL = "https://fcm.googleapis.com/fcm/send"
    static let serverKey = "AAAAmwijXZs:APA91bEZML7a3tSj5ZXx_blAMatrHwlroRrHfuqCF8n3gpW6dFwAPVncQdZOBlwkfodfxJRhl7OiS1zBnH8oUNwLQB7Unk6KHlRr3LhpdQbvL6GZ4pRMLTLUV2EIRPUpI1lcFIUTAza7"
    static let deviceToken = "dqtVN2oRo0wPgr61TLGt7q:APA91bF2rkArdF9cVrvDHZfjkb6t1-dUPGqd0M3_q4B0ptCpFKZ4b9Q1PjctSBBRD_-YQr5rRPiQA_djrsyVaPZt4Rb7WAk7cWTRHaOhGdEufmv7ewYCFxIB2SXB2TGOnCGuOXsFUtbg"
     
    // MARK: - Remainings
    static let dismiss = "Annuleer"
    static let oneToTen = "123456790"
    static let eMailValidatorRegEx = NSPredicate(format: "SELF MATCHES %@", "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
                                                 "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
                                                 "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
                                                 "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
                                                 "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
                                                 "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
                                                 "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")

}
