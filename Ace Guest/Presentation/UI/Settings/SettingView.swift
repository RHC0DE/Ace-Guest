//
//  Ace Guest
//


import SwiftUI

struct SettingView: View {
    @EnvironmentObject var viewModel: AppointmentViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center, spacing: 0) {
                
                Form {
                    
                    Section {
                        
                        NavigationLink(destination: MessagesView(), label: {
                            
                            SetttingRow(icon: Images.envelopeFilled, text: Strings.messageHeader)
                            
                        })
                        .foregroundColor(.clear)
                        
                        NavigationLink(destination: AppSettingsView(), label: {
                            
                            SetttingRow(icon: Images.gearIcon, text: Strings.settingsHeader)
                            
                        })
                        .foregroundColor(.clear)
                        
                        NavigationLink(destination: PersonalDetailsView(), label: {
                            
                            SetttingRow(icon: Images.personBadge, text: Strings.personalDetailHeader)
                            
                        })
                        .foregroundColor(.clear)
                        
                        NavigationLink(destination: AboutView(), label: {
                            
                            SetttingRow(icon: Images.cirleIcon, text: Strings.aboutHeader)
                            
                        })
                        .foregroundColor(.clear)
                        
                    }
                    
                    FormSpacer()
                    
                    Section {
                        Button(action: {
                            self.viewModel.shouldShowLogOutOptions.toggle()
                            
                        }) {
                            HStack{
                                Spacer()
                                Text(Strings.logout)
                                Spacer()
                            }
                        }
                        .foregroundColor(.white)
                        .frame(width: 380, height: 50)
                        .background(Color(Colors.systemRed ))
                        .cornerRadius(15)
                        
                        
                    }
                    .listRowBackground(Color.clear)
                    
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .compact)
                
            }
            .actionSheet(isPresented: self.$viewModel.shouldShowLogOutOptions) {
                .init(title: Text(Strings.popUpProfileTitle), message: Text(Strings.popUpProfileBody), buttons: [
                    .destructive(Text(Strings.logout), action: {
                        print("Handle Sign out")
                        self.viewModel.signOutGuest()
                        
                    }),
                    .cancel()
                ])
            }
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    
                    Button(action: {
                        dismiss()
                        
                    }, label: {
                        Text(Strings.close)
                    })
                    
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        self.viewModel.shouldShowLogOutOptions.toggle()
                    }, label: {
                        Text(Strings.logout)
                    })
                    
                }
                
            }
            
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(AppointmentViewModel())

    }
}
