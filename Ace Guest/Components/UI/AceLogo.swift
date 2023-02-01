//
//  Ace Guest
//

import SwiftUI

struct AceLogo: View {
    
    var body: some View {
        Image(Images.ace_logo)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding(.top, 70)
    }
    
}

struct AceLogo_Previews: PreviewProvider {
    static var previews: some View {
        AceLogo()
    }
}
