//
//  OnBoardingContentView.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct OnBoardingContentView: View {
    
    @ObservedObject var viewmodel =  OnBoardingViewModel()
    @State  var title : String
    @State  var selectedPage : Int

    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
                    ForEach(0..<viewmodel.onBoardingSteps.count, id: \.self) { currentPage in
                        if currentPage == self.selectedPage {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(Color(Colors.systemRed))
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color(Colors.lightGray))
                            
                        }
                    }
                    
                    Spacer()
                    
                }.padding(.top, 50)
                    .padding(.leading, 20)
                
                HStack {
                    
                    Text(title)
                        .bold()
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding()
                    
                    Spacer()
                    
                }
                .padding(.top, 100)
                
                Spacer()
                
            }

        }

    }
}

struct OnBoardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView(title: "We want to use your camera services for scanning barcodes to cash in your Ace vouchers.", selectedPage: 0)
        
    }
}
