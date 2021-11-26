//
//  ContentView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Main screen that will check user log-in status and either return a view for the menu or a view for logging in

import SwiftUI

struct MainView: View {
    
    // Is the user logged in?
    @State var loggedIn = false
    
    // User's phone number
    @State var phoneNumber = ""
    
    // User's full name
    @State var fullName = ""
    
    var body: some View {
        
        // If user is logged in, display the menu. Otherwise, display the log in screen.
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
                    
                    // Text field for the user to enter their full name
                    TextField("Full Name", text: $fullName)
                        .frame(width: 150, alignment: .center)
                        .textFieldStyle(.roundedBorder)
                        .toolbar {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                        }
                    // Text field for the user to enter their phone number
                    TextField("Phone Number", text: $phoneNumber)
                        .frame(width: 150, alignment: .center)
                        .textFieldStyle(.roundedBorder)
                    
                    // Button that logs user in and sets the customer profile's phone number and full name
                    Button(action: {
                        self.loggedIn = true
                        currentCustomer.phoneNumber = phoneNumber
                        currentCustomer.fullName = fullName
                    }) {
                        Text("Log In")
                    }
                    .padding()
                    .frame(alignment: .center)
                }
                .padding()
                .frame(alignment: .center)
            }
            .padding()
            .frame(minWidth: 100, minHeight: 100, alignment: .center)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
