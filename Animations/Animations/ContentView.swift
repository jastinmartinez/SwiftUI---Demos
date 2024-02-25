//
//  ContentView.swift
//  Animations
//
//  Created by Jastin on 25/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var scaleEffectValue = 1.0
    @State var scaleEffectValueV2 = 1.0
    @State var scaleEffectValueV3 = 1.0
    
    var body: some View {
        
        VStack {
            //        Implicit animation
            Button("Tap Me") {
                scaleEffectValue += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(scaleEffectValue)
            .animation(.default, value: scaleEffectValue)
            .blur(radius: (scaleEffectValue - 1) * 2)
            
//            Custom Animation
            Button("Tap Me") {
                scaleEffectValueV2 += 1
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(scaleEffectValueV2)
            .animation(.spring(duration: 1.0, bounce: 0.9), value: scaleEffectValueV2)
            
            //            Custom Animation
            Button("Tap Me") {
        
            }
            .padding(50)
            .background(.yellow)
            .foregroundColor(.white)
            .clipShape(.circle)
            .overlay {
                Circle()
                    .stroke(.red)
                    .scaleEffect(scaleEffectValueV3)
                    .opacity(2 - scaleEffectValueV3)
                    .animation(.easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                               value: scaleEffectValueV3)
                    
            }
           
        }.onAppear {
            scaleEffectValueV3 = 2
        }
    }
}

#Preview {
    ContentView()
}
