//
//  GuestRegisterView.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct GuestRegisterView: View {
    
    @EnvironmentObject var viewModel: AppointmentViewModel

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section( header: Text("Start / Eind tijd"), footer: Text("")) {
                    DatePicker("Start Datum", selection: $viewModel.startDate, in: Date()...)
                        .accentColor(.red)
                        .foregroundColor(.red)
                    DatePicker("Eind Datum", selection: $viewModel.endDate, in: viewModel.startDate...)
                        .accentColor(.red)
                        .foregroundColor(.red)
                    
                }
                
                Section (header:Text("Mail"),
                         footer: Text("\(viewModel.emailErrorMessage)").foregroundColor(.red)){
                    TextField("E-mail guest", text: $viewModel.email)
                }
                
                Section(header:Text("Access code"),
                        footer:Text("\(viewModel.accessCodeErrorMessage)").foregroundColor(.red)) {
                    
                    Button(action: {
                        viewModel.createPassword()
                        print(viewModel.accessCode)
                    }) {
                        HStack {
                            Text("Generate access code")
                            Spacer()
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.red)
                        }
                    }
                    
                    HStack {
                        Text("\(viewModel.accessCode)")
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock")
                            .foregroundColor(.green)
                    }
                    
                }
                
                Section(
                    footer:
                        HStack {
                            Link(Strings.contactRegister, destination: URL(string: Strings.linkMail)!)
                                .foregroundColor(.accentColor)
                                .font(.system(size: 10, weight: .bold))
                            
                            Image(systemName: Images.personQuestion)
                                .foregroundColor(.primary)
                                .font(.system(size: 15, weight: .heavy))
                                .padding(.leading, 4)
                                .padding(.top, 10)
                        }
                        .padding(.leading, -10)) {
                            
                            Button(action: {
                                viewModel.registerGuest()
                                
                                viewModel.shouldShowSuccesRegisterAlert.toggle()
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Register guest")
                                    Spacer()
                                }
                            }
                            .disabled(!viewModel.isValid)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(!viewModel.isValid ? .gray : Color(Colors.systemRed ))
                            .cornerRadius(8)
                            .alert(isPresented: $viewModel.shouldShowSuccesRegisterAlert) {
                                Alert(title: Text("Gast geregistreerd!"),
                                      message: Text("\(viewModel.email) heeft toegang tot Club Ace vanaf \(viewModel.startDate, formatter: viewModel.dateFormatter) tot \(viewModel.endDate, formatter: viewModel.dateFormatter)"),
                                      dismissButton: .default(Text("OK")))
                                
                            }
                            /*
                             Alert(title: Text("Form submitted"),
                             message: Text("Thanks \(name)\n We will be in contact soon!"),
                             dismissButton: .default(Text("OK")))
                             */
                            
                        }
                        .listRowBackground(Color.clear)
                        .navigationTitle("Club Ace Guest Registration")
                        .navigationBarTitleDisplayMode(.inline)
                
            }
            
        }
        
    }
    
}

struct GuestRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        GuestRegisterView()
            .environmentObject(AppointmentViewModel())
    }
}
