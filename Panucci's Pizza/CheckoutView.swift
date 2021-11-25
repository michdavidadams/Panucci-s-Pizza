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
    
    // Is the order completed?
    @State var orderCompleted = false
    
    var body: some View {
        ScrollView {
            if orderCompleted == false {
                LazyVStack {
                    
                    // List of items the user is purchasing
                    HStack {
                        Text("Items: ")
                            .font(.title)
                            .padding()
                        Spacer()
                        ForEach(customerOrder.addedItems.indices, id: \.self) { index in
                            HStack {
                                Text("\(String(describing: customerOrder.addedItems[index]!.type)): $\(String(describing: customerOrder.addedItems[index]!.price)), \(String(describing: customerOrder.addedItems[index]!.details))")
                                    .padding()
                            }
                        }
                        
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
                    
                    // Button that will submit order to Panucci's Pizza
                    Button(action: {
                        print(customerOrder)
                        orderCompleted = true
                    }) {
                        Text("Submit Order")
                    }
                    .padding()
                }
            } else {
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 12, height: 12)
                        .modifier(ParticlesModifier())
                        .offset(x: -100, y : -50)
                    OrderSubmittedView()
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 12, height: 12)
                        .modifier(ParticlesModifier())
                        .offset(x: 60, y : 70)
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

// Confetti for when order is completed
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
