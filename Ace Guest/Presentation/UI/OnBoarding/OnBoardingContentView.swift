//
//  Ace Guest
//

import SwiftUI

struct OnBoardingContentView: View {
    
    @ObservedObject var viewmodel =  OnBoardingViewModel()
    @State var title : String
    @State var subTitle : String
    @State var image : String
    @State  var selectedPage : Int

    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
                    ForEach(0..<viewmodel.onBoardingPages.count, id: \.self) { currentPage in
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
                
                HStack {
                    
                    Text(subTitle)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding()
                }
                .padding(.trailing, 30)
                .padding(.top, -30)
                
                Image(image)
                
                Spacer()
                
            }

        }

    }
}

struct OnBoardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView(title: Strings.nfcOnBoardingTitle, subTitle: "In order to open the frontdoor the app is using NFC to scan the HID reader!", image: String(Images.onBoardingNFC), selectedPage: 0)
        
    }
}
