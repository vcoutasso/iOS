//
//  ButtonView.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct ButtonView: View {
    @AppStorage("showOnboarding") var showOnboarding: Bool?
    
    let arrowSymbolName: String = "arrow.forward.circle"
    
    var body: some View {
        Button {
            showOnboarding = false
        } label: {
            HStack {
                Text("Start")
                
                Image(systemName: arrowSymbolName)
            }
        }
        .padding(10)
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.white)
        )
        .offset(y: 0.03 * UIScreen.main.bounds.height)
    }
}

#if DEBUG
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .preferredColorScheme(.dark)
    }
}
#endif
