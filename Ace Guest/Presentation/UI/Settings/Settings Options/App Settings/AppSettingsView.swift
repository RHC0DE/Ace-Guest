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
            
            }
            
        }
        
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
