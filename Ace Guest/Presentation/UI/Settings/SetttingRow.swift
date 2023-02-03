//
//  Ace Guest
//


import SwiftUI

struct SetttingRow: View {
    @State var icon: String
    @State var text: String
    
    var body: some View {
        
        HStack {
            Image(systemName: self.icon)
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(Color(Colors.systemRed))


            Text(self.text)
                .foregroundColor(.primary)
        }
        
    }
    
}

struct SetttingRow_Previews: PreviewProvider {
    static var previews: some View {
        SetttingRow(icon: "gear", text: "Form")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        
    }
}
