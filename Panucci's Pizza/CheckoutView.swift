//
//  CheckoutView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Checkout screen

import SwiftUI

struct CheckoutView: View {
    // Payment and pickup methods
    @State var chosenPaymentMethod = customerOrder.payWithCash
    @State var chosenMethod = customerOrder.pickup
    
    // Customer information
    @State var deliveryDetails: String = ""
    @State var paymentInformation: String = ""
    
    var body: some View {
        LazyVStack {
            HStack {
                Text("Items: ")
                    .font(.title)
                    .padding()
                Spacer()
                ForEach(customerOrder.foodItem.indices) { index in
                    Text("\(customerOrder.foodItem[index])")
                        .font(.body)
                        .padding()
                }
            }
            Divider()
            VStack {
                HStack {
                    Text("Pick-up/Delivery Method:")
                        .font(.title)
                        .padding()
                    
                    Picker(selection: $chosenMethod, label: Text("Choose method")) {
                        Text("Pick-up").tag(customerOrder.pickup == true)
                        Text("Delivery").tag(customerOrder.pickup == false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                if chosenMethod == false { // If picking up
                    HStack {
                        Text("Enter delivery information")
                        TextField("123 Downtown Avenue, Manhattan, Old New York", text: $deliveryDetails)
                            .frame(width: 400.0)
                    }
                } else {
                    HStack {
                        Text("Enter zip code")
                            .padding(.leading)
                        TextField("10024", text: $deliveryDetails)
                            .padding(.trailing)
                            .frame(width: 80.0)
                    }
                    
                }
            }
            Divider()
            VStack {
                HStack {
                    Text("Payment Method: ")
                        .font(.title)
                        .padding()
                    Picker(selection: $chosenPaymentMethod, label: Text("Choose payment method")) {
                        Text("Cash").tag(customerOrder.payWithCash == true)
                        Text("Card").tag(customerOrder.payWithCash == false)
                    }
                }
                if chosenPaymentMethod == false { // If paying with card
                    HStack {
                        Text("Enter card number")
                        TextField("0000-0000-0000-0000", text: $paymentInformation)
                            .frame(width: 165.0)
                    }
                    .padding()
                } else {
                    
                }
            }
            Divider()
            HStack {
                Text("Total: ")
                    .font(.title)
                    .padding()
                Spacer()
                Text("$\(customerOrder.orderTotal)")
                    .font(.body)
                    .padding()
            }
            Divider()
            Button(action: {
                print(customerOrder)
            }) {
                Text("Submit Order")
            }
            .padding(.horizontal)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
