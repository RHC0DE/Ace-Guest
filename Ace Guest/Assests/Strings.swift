//
//  Ace Guest
//

import Foundation

struct Strings {
    
    // MARK: - Login Page
    static let registerTitle = "Registreer uw toegangspas."
    static let register = "Registreer"
    static let noAccesCode = "Geen HID Mobile Access uitnodigingscode ontvangen?"
    static let contact = "Neem contact op met de receptie"
    static let linkTel = "tel:0202184757"
    static let alertFailedAccessTitle = "Mislukte toegangspas registratie"
    static let alertFailedAccessBody = "De toegang is tijdelijk uitgeschakeld vanwege vele mislukte inlogpogingen. Probeer het over 5 minuten opnieuw of raadpleeg de receptie"
    static let alertFailedLoginBody = "Het ingevoerde toegangscode is niet correct, controleer "
    static let ok = "Ok"
    
    // MARK: - Register Page
    static let contactRegister = "\nNeem contact op met de receptie voor registratie wijzigingen"
    static let linkMail = "hello@thisisace.nl"
    
    // MARK: - Landing Page
    static let landingTitle = "Welkom \nbij Club Ace!"
    static let landingBody = "Doorloop deze snelle setup om het meeste uit deze app te halen."
    static let letsGo = "Let's go!"
    
    // MARK: - OnBoarding Page
    static let notificationOnBoardingTitle = "Tijdens het betreden van het Club Ace kantoor worden belangrijke berichten verstuurd zoals de status updates van uw huidige afspraak!"
    static let nfcOnBoardingTitle = "Om de deuren te openen van het Club Ace kantoor wordt NFC toegepast!"
    static let next = "Volgende"
    static let getStarted = "Get started"
    static let accepted = "Accepteer"
    
    // MARK: - CardView Page
    static let accessPassTitle = "Toegangspas"
    static let amsterdam = "Amsterdam"
    static let hiddenAccessCode =  "xxxxxx"
    static let scanner = "Scan"

    // MARK: - Terms And Conditions Page
    static let ourConditionsTitle = "Onze voorwaarden"
    static let termsAndConditionsBody = "Lees en accepteer de voorwaarden voordat u aan de slag kunt met uw account."
    static let iAgreeTermsAndConditions = "Ik ga akkoord met de "
    static let termsAndConditions = "algemene voorwaarden"
    static let termsAndConditionsLink = "https://www.thisisace.nl/en/terms-conditions"
    static let iAgreePrivacyPolicy = "Ik ga akkoord met het "
    static let privacyPolicy = "privacybeleid"
    static let privacyPolicyLink = "https://club-ace-test.s3.eu-central-1.amazonaws.com/static/pdf/Privacy+Policy.pdf"
    static let errorMessageTermsAndConditions = "U dient zowel de algemene voorwaarden als het privacybeleid te accepteren om verder te kunnen gaan."
    
    // MARK: -  Settings Page
    static let messageHeader = "Berichten"
    static let settingsHeader = "Instellingen"
    static let personalDetailHeader = "Persoonlijke details"
    static let aboutHeader = "Over deze app"
    static let logout = "Loguit"
    static let popUpProfileTitle = "Profiel instellingen"
    static let popUpProfileBody = "Weet je zeker dat je wilt uitloggen?"
    static let close = "Sluiten"
    
    // MARK: - Messages Page
    static let welcomeMessage = "Welkom in Club Ace!"
    static let aceMessageHeaderText = "Ace"
    static let messageBody =  "De medewerker is op de hoogte gesteld van uw aankomst en komt er zo snel mogelijk aan. In de tussentijd kunt u de link in de bijlage bekijken indien er interesse is in een hapje of drankje. \n\nEen fijne dag verder toegewenst en bedankt voor het gebruik van de Club Ace Guest app! \n\nMet vriendelijke groet, \n\nThe Ace Family"
    static let attachment = "Bijlage"
    static let attechmentLink = "https://docs.google.com/document/d/18-Ly8AFdIwZwlZMZKNf7z_SDYx7zAuIagTvVCV0BV1o/edit?usp=sharing"
    static let couponText = "coupons.doc"

    // MARK: - App Settings Page
    static let appSettingsHeaderText = "App instellingen"
    static let pushNotifications = "Push notificaties"
    static let couponDocText = "coupons.doc"
    static let englishHeader = "English"
    
    // MARK: - Personal Details Page
    static let personalDetailsHeader = "Persoonlijke details"
    static let emailAdress = "Email address"
    static let startDateAndTime = "Start datum/tijd"
    static let endDateAndTime = "Eind datum/tijd"

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
    static let deviceToken = "e3iQq5Mv8k2EoD0VuVdylb:APA91bGnUx8St4agnBfmRGbm5NnF2Pxio9lB0Vtt3TKUo6O4M2UiawlXJBqV874gCl_hhL-g9zd5K8L3AmjuCjiJcnap80jAvDJY8hsMpUGhNfYmyWlj4Mo5xncFGZk9PFzk66dFctky"
    
    // MARK: - Remainings
    static let dismiss = "Annuleer"
    static let eMailValidatorRegEx = NSPredicate(format: "SELF MATCHES %@", "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
                                                 "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
                                                 "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
                                                 "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
                                                 "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
                                                 "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
                                                 "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")

}
