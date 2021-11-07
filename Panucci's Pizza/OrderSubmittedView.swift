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
    }
}

struct OrderSubmittedView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSubmittedView()
    }
}
