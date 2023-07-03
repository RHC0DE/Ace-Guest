//
//  Ace Guest
//

import SwiftUI

struct LandingPageView: View {
    @ObservedObject private var viewModel = OnBoardingViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color(.black).ignoresSafeArea(.all, edges: .all)
            
            HStack {
                Text(Strings.landingTitle)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .padding()
            .padding(.top, -300)
            
            HStack {
                Text(Strings.landingBody)
                    .foregroundColor(.white)
                    .font(.body)
                    .padding()
                
                Spacer()
            }
            .padding(.top, -185)
            
            VStack {
                
                Button(Strings.letsGo, action: {
                    
                    self.viewModel.showOnBoardingView.toggle()
                    
                })
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 300)
                
            }
            .padding(.top, 350)
            
        }
        .fullScreenCover(isPresented: self.$viewModel.showOnBoardingView, content: TermsAndConditionsView.init)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
