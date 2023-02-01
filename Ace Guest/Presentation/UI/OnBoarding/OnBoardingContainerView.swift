//
//  OnBoardingContainerView.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct OnBoardingContainerView: View {
    @AppStorage("isOnBoaring") var isOnBoaring: Bool?
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewmodel = OnBoardingViewModel()
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    TabView(selection: self.$viewmodel.currentStep) {
                        
                        ForEach(0..<viewmodel.onBoardingSteps.count, id: \.self) { index in
                                                        
                            OnBoardingContentView(title: viewmodel.onBoardingSteps[index].title, selectedPage: viewmodel.onBoardingSteps[index].currentStep)
                            
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation {
                                if self.viewmodel.currentStep < viewmodel.onBoardingSteps.count - 1 {
                                    self.viewmodel.currentStep += 1
                                } else {
                                    isOnBoaring = false

                                }
                                
                            }
                            
                            
                        }, label: {
                            
                            if self.viewmodel.currentStep < viewmodel.onBoardingSteps.count - 1{
                                ButtonLabel(btnTitle: Strings.next)
                                
                            } else {

                                    ButtonLabel(btnTitle: Strings.getStarted)
            
                            }
                            
                        })
                        
                        Button(action: {
                            
                            dismiss()
                            
                        }, label: {
                            
                            Text(Strings.dismiss)
                                .foregroundColor(.black)
                                .bold()
                                .frame(width: 190, height: 50)
                                .background(Color(Colors.lightGray))
                                .clipShape(Capsule())
                        })
                        
                    }
                    .padding(.bottom, 50)
                    
                }
                .background(.white)
                
            }
            
        }

    }
}

struct OnBoardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContainerView()
    }
}
