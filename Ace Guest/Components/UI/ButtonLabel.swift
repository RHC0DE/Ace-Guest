//
//  Ace Guest
//

import SwiftUI

struct ButtonLabel: View {
    
    @State var btnTitle: String
    
    var body: some View {
        
        Text(btnTitle)
            .foregroundColor(.white)
            .bold()
            .frame(width: 210, height: 50)
            .background(Color.red)
            .clipShape(Capsule())
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(btnTitle: "Test Button")
    }
}
