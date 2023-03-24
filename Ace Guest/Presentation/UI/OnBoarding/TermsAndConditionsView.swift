//
//  TermsAndConditionsView.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct TermsAndConditionsView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = OnBoardingViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    Text(Strings.ourConditionsTitle)
                        .bold()
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding()
                    
                    Spacer()
                    
                }
                
                HStack {
                    Text(Strings.termsAndConditionsBody)
                        .foregroundColor(.black)
                        .padding()
                    
                    Spacer()
                }.padding(.top, -20)
                
                HStack {
                    
                    Toggle(isOn: self.$viewModel.termsAndConditionOn) {
                        
                        Text(Strings.iAgreeTermsAndConditions)
                            .bold()
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding()
                        
                        Link(Strings.termsAndConditions, destination: URL(string: Strings.termsAndConditionsLink)!)
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(Color(Colors.systemRed))
                            .padding(.top, -25)
                            .padding(.leading)
                        
                    }
                    .padding()
                    .toggleStyle(SwitchToggleStyle(tint: Color(Colors.systemRed)))
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    Toggle(isOn: self.$viewModel.privacyPolicyOn) {
                        
                        Text(Strings.iAgreePrivacyPolicy)
                            .bold()
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding()
                        
                        Link(Strings.privacyPolicy, destination: URL(string: Strings.privacyPolicyLink)!)
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(Color(Colors.systemRed))
                            .padding(.top, -25)
                            .padding(.leading)
                        
                    }
                    .padding()
                    .toggleStyle(SwitchToggleStyle(tint: Color(Colors.systemRed)))
                    
                    Spacer()
                    
                }.padding(.top, -40)
                
                if viewModel.notAcceptedMessage == true {
                    
                    HStack {
                        
                        Text(Strings.errorMessageTermsAndConditions)
                            .font(.system(size: 10))
                            .foregroundColor(Color(Colors.systemRed))
                            .padding()
                        
                        Spacer()
                        
                    }.padding()
                        .padding(.top, -50)
                    
                }
                
                Spacer()
                
                if self.viewModel.termsAndConditionOn != true || viewModel.privacyPolicyOn != true {
                    
                    Button(Strings.accepted, action: {
                        
                        viewModel.notAcceptedMessage = true
                        
                        
                    })
                    .buttonStyle(GrayedOutButtonLabel())
                    
                } else if self.viewModel.termsAndConditionOn == true && viewModel.privacyPolicyOn == true {
                    
                    NavigationLink(destination: OnBoardingContainerView().navigationBarBackButtonHidden(true), label: {
                        
                        Text(Strings.accepted)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 210, height: 50)
                            .background(Color(Colors.systemRed))
                            .clipShape(Capsule())
                        
                    })
                    
                }
                
                Button(action: {
                    
                    dismiss()
                    
                }, label: {
                    
                    Image(systemName: Images.xCircleFill)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                    
                })
                .padding()
                
            }
            .background(Color.white)
        }
        
    }
}

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsView()
    }
}
