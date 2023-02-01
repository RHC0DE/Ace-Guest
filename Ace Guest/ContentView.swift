//
//  Ace Guest
//


import SwiftUI

struct ContentView: View {
     
    @EnvironmentObject var viewModel: AppointmentViewModel
 
    var body: some View {
          
        if self.viewModel.accessPasIsRegistered == true {
             CardView()

        } else {
            GuestLoginView()

        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
