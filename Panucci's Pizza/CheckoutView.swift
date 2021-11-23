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
    @State var deliveryDetails = ""
    @State var paymentInformation = ""
    
    // Checks if order has been completed
    @State var orderCompleted = false
    
    // Customer ordered items
    @State var orderItems = customerOrder.addedItems
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                // List of items the user is purchasing
                HStack {
                    Text("Items: ")
                        .font(.title)
                        .padding()
                    Spacer()
                    
//                    ForEach(orderItems!, id: \.self) { item in
//                        HStack {
//                            Text("\(String(describing: item.type) ?? ""): \(String(describing: item.details) ?? "")")
//                            //Text("\(String(describing: item.price))")
//                        }
//                    }
                }
                Divider()
                
                // User can choose between pick-up or delivery
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
                                .textFieldStyle(.roundedBorder)
                        }
                    } else { // If getting delivered
                        HStack {
                            Text("Enter zip code")
                                .padding(.leading)
                            TextField("10024", text: $deliveryDetails)
                                .padding(.trailing)
                                .frame(width: 80.0)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                }
                Divider()
                
                // User can choose payment method
                VStack {
                    HStack {
                        Text("Payment Method: ")
                            .font(.title)
                            .padding()
                        Picker(selection: $chosenPaymentMethod, label: Text("Choose payment method")) {
                            Text("Card").tag(customerOrder.payWithCash == false)
                            Text("Cash").tag(customerOrder.payWithCash == true)
                            Text("Check").tag(customerOrder.payWithCash == false)
                        }
                    }
                    if chosenPaymentMethod == false { // If paying with card
                        HStack {
                            Text("Enter card number")
                            TextField("0000-0000-0000-0000", text: $paymentInformation)
                                .frame(width: 165.0)
                        }
                        .padding()
                    } else { // If paying with cash or check
                    }
                }
                Divider()
                
                // Will show order total
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
                
                // If order has been completed, show order submitted view. Otherwise, show button
                if orderCompleted {
                    OrderSubmittedView()
                } else {
                    // Button that will submit order to Panucci's Pizza
                    Button(action: {
                        print(customerOrder)
                        orderCompleted = true
                    }) {
                        Text("Submit Order")
                    }
                    .padding()
                }
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
