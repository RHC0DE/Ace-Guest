//
//  MessageCell.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct MessageCell: View {
    
    @ObservedObject private var viewModel = MessagesViewModel()
    @EnvironmentObject private var currentAppointment: AppointmentViewModel

    
    var body: some View {
        
        HStack {

            VStack {
                Text(self.viewModel.message?.messageTitle ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(.primary)
                    .padding()

            }
            
            Spacer()

            Image(systemName: viewModel.message?.hasAttachment ?? Bool() ? "paperclip" : "")
                .foregroundColor(.gray)
                .padding(.trailing, -20)
            
            Text(currentAppointment.guestAppointment?.appointmentMessageString ?? "")
                .font(.system(size: 10))
                .foregroundColor(.gray)
                .padding()
            
        }
        
    }
    
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
