//
//  Ace Guest
//


import SwiftUI

struct AboutView: View {
    @ObservedObject var viewModel = SettingViewModel()
    
    var body: some View {
        
        Form {
            
            Section {
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center) {
                        AceLogo()
                        Text("Version: 0.1.1.1")
                            .fontWeight(.bold)
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
            Section {
                
                Text("Over deze app")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding()
                
                Link(destination: URL(string: "https://docs.google.com/document/d/1QZ8rhe7xib-QALYipjpIpF4p9p6JrMBkqhED2gfMZKk/edit?usp=share_link")!) {
                    
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(Colors.systemRed))
                        
                        
                        Text("Het doeleinde van de app")
                            .foregroundColor(.primary)
                        
                    }
                    
                }
                
                Link(destination: URL(string: Strings.termsAndConditionsLink)!) {
                    
                    HStack {
                        Image(systemName: "doc.fill")
                            .resizable()
                            .frame(width: 20, height: 25)
                            .foregroundColor(Color(Colors.systemRed))
                        
                        
                        Text("Algemene voorwaarden")
                            .foregroundColor(.primary)
                        
                    }
                    
                }
                
                Link(destination: URL(string: Strings.privacyPolicyLink)!) {
                    
                    HStack {
                        Image(systemName: "lock.doc.fill")
                            .resizable()
                            .frame(width: 20, height: 25)
                            .foregroundColor(Color(Colors.systemRed))
                        
                        
                        Text("Privacybeleid")
                            .foregroundColor(.primary)
                        
                    }
                    
                }
                
            }
            
            FormSpacer()
            
            FormSpacer()

        }
        
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
