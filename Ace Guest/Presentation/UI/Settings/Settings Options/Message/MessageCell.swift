//
//  Ace Guest
//

import SwiftUI

struct MessageCell: View {
    
    @EnvironmentObject private var currentAppointment: AppointmentViewModel
    
    var body: some View {
        
        HStack {

            VStack {
            
                Text(Strings.welcomeMessage)
                    .font(.system(size: 12))
                    .foregroundColor(.primary)
                    .padding()

            }
            
            Spacer()

            Image(systemName: Images.paperclip)
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
