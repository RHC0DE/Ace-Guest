//
//  LoadingView.swift
//  Ace Guest
//
//  Created by Guest User on 03/02/2023.
//

import SwiftUI

struct LoadingView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        
        ZStack {
            
            if show {
                
                ProgressView()
                    .padding()
                    .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))

            }
            
        }.animation(.easeInOut(duration: 0.25), value: show)
        
    }
}

//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView(show: true)
//    }
//}
