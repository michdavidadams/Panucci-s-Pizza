//
//  OrderSubmittedView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/7/21.
// A screen to let the customer know their order was submitted successfully, and will contain a button to view an attributions screen

import SwiftUI

struct OrderSubmittedView: View {
    
    // Will track if button was pushed
    @State var buttonPressed = false
    
    var body: some View {
        VStack {
            Text("Thanks for ordering!")
                .font(.title)
                .padding()
            Image(systemName: "hands.sparkles")
                .font(.system(size: 30))
            if buttonPressed {
                AttributionsView()
            } else {
                Button(action: {
                    buttonPressed = true
                }) {
                    Text("Attributions")
                }
                .padding()
            }
            
        }
        .foregroundColor(.red)
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: -100, y : -50)
            
            Circle()
                .fill(Color.orange)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: 60, y : 70)
        }
    }
}

struct OrderSubmittedView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSubmittedView()
    }
}

struct FireworkParticlesGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ...  Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}

struct ParticlesModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    let duration = 5.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<80, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration-time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
    }
}
