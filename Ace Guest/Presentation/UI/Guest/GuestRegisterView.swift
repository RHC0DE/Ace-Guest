//
//  Ace Guest
//

import SwiftUI

struct GuestRegisterView: View {
    
    @EnvironmentObject var viewModel: AppointmentViewModel

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section( header: Text(Strings.startAndEndTime), footer: Text("")) {
                    DatePicker(Strings.startDate, selection: $viewModel.startDate, in: Date()...)
                        .accentColor(.red)
                        .foregroundColor(.red)
                    DatePicker(Strings.endDate, selection: $viewModel.endDate, in: viewModel.startDate...)
                        .accentColor(.red)
                        .foregroundColor(.red)
                     
                }
                Section (header:Text(Strings.mail),
                         footer: Text("\(viewModel.emailErrorMessage)").foregroundColor(.red)){
                    TextField(Strings.eMailGuest, text: $viewModel.email)
                }
                
                Section(header:Text(Strings.accessCode),
                        footer:Text("\(viewModel.accessCodeErrorMessage)").foregroundColor(.red)) {
                    
                    Button(action: {
                        viewModel.createPassword()
                        print("The generated accesscode is: ", viewModel.accessCode)
                    }) {
                        HStack {
                            Text(Strings.generateAccesscode)
                            Spacer()
                            Image(systemName: Images.arrowCircle)
                                .foregroundColor(.red)
                        }
                    }
                    
                    HStack {
                        Text("\(viewModel.accessCode)")
                            .textSelection(.enabled)
                        Spacer()
                        Button(action: {
                            viewModel.copyToClipBoard()
                        }, label: {
                            Image(systemName: Images.docFill)
                                .foregroundColor(.blue)
                        })
                        Image(systemName: Images.lock)
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
                                    Text(Strings.registerGuest)
                                    Spacer()
                                }
                            }
                            .disabled(!viewModel.isValid)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(!viewModel.isValid ? .gray : Color(Colors.systemRed))
                            .cornerRadius(8)
                            .alert(isPresented: $viewModel.shouldShowSuccesRegisterAlert) {
                                Alert(title: Text(Strings.guestRegistered),
                                      message: Text("\(viewModel.email) \(Strings.hassAccessFrom) \(viewModel.startDate, formatter: viewModel.dateFormatter) \(Strings.till) \(viewModel.endDate, formatter: viewModel.dateFormatter)"),
                                      dismissButton: .default(Text(Strings.ok)))
                                
                            }
                            /*
                             Alert(title: Text("Form submitted"),
                             message: Text("Thanks \(name)\n We will be in contact soon!"),
                             dismissButton: .default(Text("OK")))
                             */
                            
                        }
                        .listRowBackground(Color.clear)
                        .navigationTitle(Strings.clubAceRegistration)
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
