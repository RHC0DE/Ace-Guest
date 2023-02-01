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
                            
                            SetttingRow(icon: "envelope.fill", text: "Berichten")
                            
                        })
                        .foregroundColor(.clear)
                        
                        NavigationLink(destination: AppSettingsView(), label: {
                            
                            SetttingRow(icon: "gear", text: "Instellingen")
                            
                        })
                        .foregroundColor(.clear)
                        
                        NavigationLink(destination: PersonalDetailsView(), label: {
                            
                            SetttingRow(icon: "house.fill", text: "Persoonlijke details")
                            
                        })
                        .foregroundColor(.clear)
                        
                        NavigationLink(destination: AboutView(), label: {
                            
                            SetttingRow(icon: "info.circle.fill", text: "Over deze app")
                            
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
                                Text("Loguit")
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
                .init(title: Text("Profiel instellingen"), message: Text("Weet je zeker dat je wilt uitloggen?"), buttons: [
                    .destructive(Text("Log uit"), action: {
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
                        Text("Sluiten")
                    })
                    
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        self.viewModel.shouldShowLogOutOptions.toggle()
                    }, label: {
                        Text("Loguit")
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
