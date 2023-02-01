//
//  Ace Guest
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 210, height: 50)
            .background(Color.red)
            .font(.footnote.weight(.bold))
            .clipShape(Capsule())
    }
}

