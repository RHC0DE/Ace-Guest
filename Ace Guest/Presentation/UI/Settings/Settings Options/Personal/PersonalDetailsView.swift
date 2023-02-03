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
                    Text(Strings.personalDetailsHeader)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding()
                    
                    PersonalDetailRow(headText: Strings.emailAdress, subText: "\(viewModel.guestAppointment?.email ?? "")", icon: Images.envelopeFilled)
                    PersonalDetailRow(headText: Strings.startDateAndTime, subText: "\(viewModel.guestAppointment?.startDateString ?? "")", icon: Images.calendarClock)
                    PersonalDetailRow(headText: Strings.endDateAndTime, subText: "\(viewModel.guestAppointment?.endDateString ?? "")", icon: Images.calendarExclamationmark)
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
