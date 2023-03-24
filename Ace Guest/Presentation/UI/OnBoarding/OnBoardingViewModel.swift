//
//  OnBoardingViewModel.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import Foundation
import SwiftUI

class OnBoardingViewModel: ObservableObject {
    
    //OnBoarding
    @Published var onBoardingItem: OnBoarding?
    @Published var showOnBoardingView: Bool = false
    @Published var onBoardingPages: [OnBoarding] = [
        OnBoarding(title: Strings.nfcOnBoardingTitle,subTitle: Strings.nfcOnBoardingSubTitle, image: String(Images.onBoardingNFC), currentPage: 0),
        OnBoarding(title: Strings.notificationOnBoardingTitle, subTitle: Strings.notificationOnBoardingSubTitle, image: String(Images.onboardingNotification), currentPage: 1)
    ]
    @Published var currentPage = 0

    // Terms and Conditioning
    @Published var termsAndConditionOn: Bool = false
    @Published var privacyPolicyOn: Bool = false
    @Published var notAcceptedMessage: Bool = false
    
}
