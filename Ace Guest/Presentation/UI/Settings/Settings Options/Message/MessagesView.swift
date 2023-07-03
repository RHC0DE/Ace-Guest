//
//  Ace Guest
//

import SwiftUI

struct MessagesView: View {
    @ObservedObject var viewModel = MessagesViewModel()
    
    var body: some View {
        
        NavigationView {
                            
                List(viewModel.messages) { message in
                    NavigationLink(destination: MessageDetail(message: message).navigationBarBackButtonHidden(true), label: {
                        MessageCell()

                    })

                }
                
            .navigationTitle("Berichten")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.viewModel.fetchMessage()
            }

        }
        
    }
    
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
