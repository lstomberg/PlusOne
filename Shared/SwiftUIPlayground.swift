//
//  SwiftUITesting.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation
import SwiftUI


struct ASDF: View {
    @State var animationAmount: CGFloat = 0
    
    var body: some View {
        Button("Tap Me") {
            // self.animationAmount += 1
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
            Rectangle().stroke(Color.blue)
                .scaleEffect(animationAmount)
                        .opacity(Double(2-animationAmount))
                        .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
}





struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ASDF()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 250, height: 400))
    }
}
