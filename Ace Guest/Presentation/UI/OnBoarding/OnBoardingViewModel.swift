//
//  OnBoardingViewModel.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import Foundation

class OnBoardingViewModel: ObservableObject {
    
    //OnBoarding
    @Published var onBoardingItem: OnBoarding?
    @Published var showOnBoardingView: Bool = false
    @Published var onBoardingSteps: [OnBoarding] = [
        OnBoarding(title: Strings.bluethoothOnBoardingTitle, currentStep: 0),
        OnBoarding(title: Strings.notificationOnBoardingTitle, currentStep: 1)
    ]
    @Published var currentStep = 0

    // Terms and Conditioning
    @Published var termsAndConditionOn: Bool = false
    @Published var privacyPolicyOn: Bool = false
    @Published var notAcceptedMessage: Bool = false
    
}
