//
//  Ace Guest
//


import SwiftUI

struct AppSettingsView: View {
    
    @ObservedObject var viewModel = SettingViewModel()
    
    var body: some View {
        
        Form {
            
            Section {
                
                Text(Strings.appSettingsHeaderText)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding()
                
                HStack {
                    Image(systemName: Images.bell)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Colors.systemRed))
                    
                    
                    Text(Strings.pushNotifications)
                        .foregroundColor(.primary)
                    
                    Spacer ()
                    
                    Toggle(isOn: self.$viewModel.receiveNotificationsOn) {}
                        .toggleStyle(SwitchToggleStyle(tint: Color(Colors.systemRed)))
                    
                }
                
                HStack {
                    Image(systemName: Images.bubbleFill)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Colors.systemRed))
                    
                    
                    Text(Strings.couponDocText)
                        .foregroundColor(.primary)
                        .padding()
                    
                    Spacer ()
                    
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Text(Strings.englishHeader)
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Image(systemName: Images.chevronRight)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.primary)
                        }
                  
                        
                    })

                    
                }
                
            }
            
        }
        
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
