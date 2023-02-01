//
//  PersonalDetailsView.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct PersonalDetailsView: View {
    @EnvironmentObject var viewModel: AppointmentViewModel

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    Text("Persoonlijke details")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding()
                    
                    PersonalDetailRow(headText: "Email address", subText: "\(viewModel.guestAppointment?.email ?? "")", icon: "envelope.fill")
                    PersonalDetailRow(headText: "Start datum/tijd", subText: "\(viewModel.guestAppointment?.startDateString ?? "")", icon: "calendar.badge.clock")
                    PersonalDetailRow(headText: "Eind datum/tijd", subText: "\(viewModel.guestAppointment?.endDateString ?? "")", icon: "calendar.badge.exclamationmark")
                }

            }
            
        }
        
    }
}

struct PersonalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailsView()
            .environmentObject(AppointmentViewModel())

    }
}
