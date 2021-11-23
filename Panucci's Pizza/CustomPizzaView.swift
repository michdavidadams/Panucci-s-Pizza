//
//  BuildAPizzaView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/4/21.
//  Build-A-Pizza screen

import SwiftUI

struct CustomPizzaView: View {
    
    // Variables for build-a-pizza size, crust, and choice of 4 toppings
    @State var chosenSize = ""
    @State var chosenCrust = ""
    @State var chosenToppingOne = ""
    @State var chosenToppingTwo = ""
    @State var chosenToppingThree = ""
    @State var chosenToppingFour = ""
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    Text("Size:")
                        .font(.title)
                        .padding()
                    
                    // Picker for build-a-pizza size
                    Picker(selection: $chosenSize, label: Text("Choose size")) {
                        Text("Small").tag("small")
                        Text("Medium").tag("medium")
                        Text("Large").tag("large")
                        Text("Extra Large").tag("extra large")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                .padding()

                Divider()
                
                HStack {
                    Text("Toppings:")
                        .font(.title)
                        .padding()
                    Spacer()
                    
                    // Pickers for build-a-pizza choice of 4 toppings
                    VStack {
                            Picker("Topping 1", selection: $chosenToppingOne) {
                                ForEach(toppingOptions, id: \.self) { index in
                                    Text("\(index)").tag(index)
                                }
                            }
                            .padding(.horizontal)
                            .frame(width: 230.0)
                        
                            Picker("Topping 2", selection: $chosenToppingTwo) {
                                ForEach(toppingOptions, id: \.self) { index in
                                    Text("\(index)").tag(index)
                                }
                            }
                            .padding(.horizontal)
                            .frame(width: 230.0)
                        
                        
                            Picker("Topping 3", selection: $chosenToppingThree) {
                                ForEach(toppingOptions, id: \.self) { index in
                                    Text("\(index)").tag(index)
                                }
                            }
                            .padding(.horizontal)
                            .frame(width: 230.0)
                        
                            Picker("Topping 4", selection: $chosenToppingFour) {
                                ForEach(toppingOptions, id: \.self) { index in
                                    Text("\(index)").tag(index)
                                }
                            }
                            .padding(.horizontal)
                            .frame(width: 230.0)
                        
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Crust:")
                        .font(.title)
                        .padding()
                    
                    // Picker for build-a-pizza crust
                    Picker(selection: $chosenCrust, label: Text("Choose crust")) {
                        Text("Thin").tag("thin")
                        Text("Pan").tag("pan")
                        Text("Deep Dish").tag("deep dish")
                        Text("Cheese-Filled").tag("cheese-filled")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                .padding()
                
                Divider()
                
                // Button that will create arrays of 4 chosen toppings and will create a Build-A-Pizza containing the array, along with the chosen crust and size
                Button(action: {
                    // Creates a custom pizza
                    let allChosenToppings = [chosenToppingOne, chosenToppingTwo, chosenToppingThree, chosenToppingFour]
                    let customPizza = OrderItem(type: .customPizza, price: 0, details: "Size: \(chosenSize), Crust: \(chosenCrust), Toppings: \(allChosenToppings)")
                    // Adds custom pizza to order
                    addToOrder(addedItem: customPizza)
                    
                }) {
                    Text("Create Pizza")
                }
                .padding()
            }
        }
    }
}

struct BuildAPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPizzaView()
    }
}