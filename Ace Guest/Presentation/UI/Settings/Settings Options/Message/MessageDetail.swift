//
//  MessageDetail.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct MessageDetail: View {
    
    @EnvironmentObject var currentAppointment: AppointmentViewModel
    @State var message: Message?
    
    var body: some View {
        
        Form {
            Section {
                Text(self.message?.messageTitle ?? "")
                    .font(.body)
                
                
            }
            
            Section {
                HStack {
                    Text("Ace")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(self.currentAppointment.guestAppointment?.appointmentMessageString ?? "")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    
                }
                
                HStack {
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("Beste \(self.currentAppointment.guestAppointment?.email ?? ""), ")
                            .font(.system(size: 12))
                            .padding()
                            .padding(.leading, -15)
                        
                        // Text(message?.messageBody ?? "")   DE ALIGNMENT IS NIET CORRECT, LATER UITZOEKEN
                        Text("De medewerker is op de hoogte gesteld van uw aankomst en komt er zo snel mogelijk aan. In de tussentijd kunt u de link in de bijlage bekijken indien er interesse is in een hapje of drankje. \n\nEen fijne dag verder toegewenst en bedankt voor het gebruik van de Club Ace Guest app! \n\nMet vriendelijke groet, \n\nThe Ace Family")
                            .font(.system(size: 12))
                            .padding()
                            .padding(.leading, -15)
                            .padding(.top, -15)
                        
                        Image("bottem_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    
                    
                }
                
            }
            
            Section {
                
                HStack {
                    Text("Bijlage")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                            
                Link(destination: URL(string: "https://docs.google.com/document/d/18-Ly8AFdIwZwlZMZKNf7z_SDYx7zAuIagTvVCV0BV1o/edit?usp=sharing")!) {
                    
                    HStack {
                        Image(systemName: "paperclip")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(Colors.systemRed))
                        
                        
                        Text("coupons.doc")
                            .foregroundColor(.primary)
                        
                        Spacer ()
                        
                        Text(self.currentAppointment.guestAppointment?.appointmentMessageString ?? "")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    
                }
                
            }
            
        }
        
    }
}

//struct MessageDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageDetail()
//    }
//}
