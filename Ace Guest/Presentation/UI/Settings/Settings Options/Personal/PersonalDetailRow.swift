//
//  PersonalDetailRow.swift
//  Ace Guest
//
//  Created by Guest User on 01/02/2023.
//

import SwiftUI

struct PersonalDetailRow: View {
    @State var headText: String
    @State var subText: String
    @State var icon: String
    
    var body: some View {
        
        HStack {
 
            VStack(alignment: .leading) {
                
                Text(self.headText)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                
                Text(self.subText)
                    .foregroundColor(.primary)
                
            }

            Spacer()
            
            Image(systemName: self.icon)
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(Color(Colors.systemRed))
            
        }
        
    }

}

struct PersonalDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailRow(headText: "Email address", subText: "JanBakker@mail.com", icon: "gear")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        
    }
}
