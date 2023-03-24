//
//  GuestLoginView.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI
import Firebase

struct GuestLoginView: View {
    @EnvironmentObject var viewModel: AppointmentViewModel

    var body: some View {
        VStack{
            
            AceLogo()
            
            VStack(spacing:20) {
                
                Text(Strings.registerTitle)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                
                // Mail inputField
                HStack(spacing: 15) {
                    
                    Image(systemName: Images.envelope)
                        .foregroundColor(Color(Colors.systemRed))
                    
                    TextField(Strings.mail, text: self.$viewModel.email)
                        .keyboardType(.emailAddress)
                        .foregroundColor(.primary)
                    
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(.primary)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray)
                )
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding(.vertical)
                
                Text(self.viewModel.emailErrorMessage)
                    .foregroundColor(.red)
                    .padding(.top, -30)
                
                // Accesscode inputField
                    HStack(spacing: 15) {
                        
                        Image(systemName: Images.lockOpen)
                            .foregroundColor(.green)
                        
                        SecureField(Strings.accessCode, text: self.$viewModel.accessCode)
                            .keyboardType(.numberPad)
                            .foregroundColor(.primary)
                        
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(.primary)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                    )
                    .padding(.bottom, 20)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                    .padding(.top, -10)
           
                Text(self.viewModel.accessCodeErrorMessage)
                    .foregroundColor(.red)
                    .padding(.top, -30)
                
                // Register button
                Button(action: {
                    self.viewModel.loginGuest()
                    self.viewModel.invalidAttemptsToLogin()
                }) {
                    
                    Text(Strings.register)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 210, height: 50)
                        .background(!self.viewModel.isValid || self.viewModel.isDisabled ? .gray : Color(Colors.systemRed ))
                        .clipShape(Capsule())
                    
                }
                .disabled(!self.viewModel.isValid)
                .padding(.bottom, 50)
                .onReceive(self.viewModel.timer) { (_) in
                    self.viewModel.loginTimeout()
                }
                
            }
            .padding(.horizontal)
            .padding(1)
            .background(.regularMaterial)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(radius: 1)
            .padding()
            
            // No code title
            Text(Strings.noAccesCode)
                .foregroundColor(.primary)
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding()
            
            // Receptie cellphone call
            HStack {
                
                Link(Strings.contact, destination: URL(string: Strings.linkTel)!)
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .bold))
                
                Image(systemName: Images.chevronRight)
                    .foregroundColor(.gray)
                    .font(.system(size: 10, weight: .heavy))
                    .padding(.leading, -5)
                
            }
            
        }
        .background()
        .overlay(content: {
            LoadingView(show: self.$viewModel.isLoading)
        })
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in

                if user != nil {
                    self.viewModel.accessPasIsRegistered = true
                    self.viewModel.fetchCurrentAppointment()
                }
                print("The status of the accespass is: ----> \(self.viewModel.accessPasIsRegistered)  <----")

            }
        }
        .alert(self.viewModel.errorMessage, isPresented: self.$viewModel.showLoginError, actions: {})
        .alert(isPresented: self.$viewModel.showMaxAttemptsReachedAlert) { () -> Alert in
            Alert(title: Text(Strings.alertFailedAccessTitle), message: Text(Strings.alertFailedAccessBody), dismissButton: .default(Text(Strings.ok)))
            
        }
        
    }
    
}

struct GuestLoginView_Previews: PreviewProvider {
    static var previews: some View {
        GuestLoginView()
            .environmentObject(AppointmentViewModel())

    }
}
