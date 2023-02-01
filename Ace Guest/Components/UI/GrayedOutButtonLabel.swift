//
//  Ace Guest
//

import SwiftUI

struct GrayedOutButtonLabel: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 210, height: 50)
            .background(Color.gray)
            .font(.footnote.weight(.bold))
            .clipShape(Capsule())
    }
}
