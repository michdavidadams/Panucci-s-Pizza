//
//  OrderSubmittedView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/7/21.
// A screen to let the customer know their order was submitted successfully, and will contain a button to view an attributions screen

import SwiftUI

struct OrderSubmittedView: View {
    
    @State var attributionsPopover = false
    
    var body: some View {
        VStack {
            Text("Thanks for ordering!")
                .font(.largeTitle)
                .padding()
            ZStack {
                Button(action: {
                    self.attributionsPopover = true
                }) {
                    Image(systemName: "hand.thumbsup")
                }
                .frame(width: 35.0, height: 35.0)
                .opacity(0)
                Image(systemName: "hand.thumbsup")
                    .font(.system(size: 35))
            }
            .popover(isPresented: $attributionsPopover) {
                AttributionsView()
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
