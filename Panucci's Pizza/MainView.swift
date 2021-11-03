//
//  ContentView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import SwiftUI

struct MainView: View {
    // Is user logged in?
    @State var loggedIn = false
    // User phone Number
    @State var phoneNumber: String = ""
    
    var body: some View {
        if loggedIn == true {
            MenuView()
        } else {
            VStack {
                Text("🍕 Panucci's Pizza")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding()
                VStack {
                    TextField("Phone Number", text: $phoneNumber)
                        .frame(width: 150, alignment: .center)
                    Button(action: {
                        self.loggedIn = true
                    }) {
                        Text("Log In")
                    }
                    .frame(alignment: .center)
                }
                .padding()
                .frame(alignment: .center)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
