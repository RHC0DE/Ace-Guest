//
//  Ace Guest
//


import SwiftUI

struct AppSettingsView: View {
    
    @ObservedObject var viewModel = SettingViewModel()
    
    var body: some View {
        
        Form {
            
            Section {
                
                Text("App instellingen")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding()
                
                HStack {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Colors.systemRed))
                    
                    
                    Text("Push notificaties")
                        .foregroundColor(.primary)
                    
                    Spacer ()
                    
                    Toggle(isOn: self.$viewModel.receiveNotificationsOn) {}
                        .toggleStyle(SwitchToggleStyle(tint: Color(Colors.systemRed)))
                    
                }
                
                HStack {
                    Image(systemName: "character.bubble.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Colors.systemRed))
                    
                    
                    Text("coupons.doc")
                        .foregroundColor(.primary)
                        .padding()
                    
                    Spacer ()
                    
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Text("English")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Image(systemName: "chevron.right")
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
