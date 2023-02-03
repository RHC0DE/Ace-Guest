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
                    Text(Strings.aceMessageHeaderText)
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
                        
                        Text(Strings.messageBody)
                            .font(.system(size: 12))
                            .padding()
                            .padding(.leading, -15)
                            .padding(.top, -15)
                        
                        Image(Images.ace_message_icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    
                    
                }
                
            }
            
            Section {
                
                HStack {
                    Text(Strings.attachment)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                            
                Link(destination: URL(string: Strings.attechmentLink)!) {
                    
                    HStack {
                        Image(systemName: Images.paperclip)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(Colors.systemRed))
                        
                        
                        Text(Strings.couponText)
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
