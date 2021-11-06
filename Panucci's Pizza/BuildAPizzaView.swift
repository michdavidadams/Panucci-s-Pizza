//
//  BuildAPizzaView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/4/21.
//

import SwiftUI

struct BuildAPizzaView: View {
    @State var chosenSize = ""
    @State var chosenCrust = ""
    @State var chosenToppingOne = ""
    @State var chosenToppingTwo = ""
    @State var chosenToppingThree = ""
    @State var chosenToppingFour = ""
    
    var body: some View {
        LazyVStack {
            HStack {
                Text("Size:")
                    .font(.title)
                    .padding()
                
                Picker(selection: $chosenSize, label: Text("Choose size")) {
                    Text("Small").tag("small")
                    Text("Medium").tag("medium")
                    Text("Large").tag("large")
                    Text("Extra Large").tag("extra large")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            Divider()
            HStack {
                Text("Toppings:")
                    .font(.title)
                    .padding()
                VStack {
                    HStack {
                        Picker("Topping 1", selection: $chosenToppingOne) {
                            ForEach(toppingOptions, id: \.self) { index in
                                Text("\(index)").tag(index)
                            }
                        }
                        Picker("Topping 3", selection: $chosenToppingThree) {
                            ForEach(toppingOptions, id: \.self) { index in
                                Text("\(index)").tag(index)
                            }
                        }
                    }
                    HStack {
                        Picker("Topping 2", selection: $chosenToppingTwo) {
                            ForEach(toppingOptions, id: \.self) { index in
                                Text("\(index)").tag(index)
                            }
                        }
                        Picker("Topping 4", selection: $chosenToppingFour) {
                            ForEach(toppingOptions, id: \.self) { index in
                                Text("\(index)").tag(index)
                            }
                        }
                    }
                }
                .padding()
            }
            Divider()
            HStack {
                Text("Crust:")
                    .font(.title)
                    .padding()
                
                Picker(selection: $chosenCrust, label: Text("Choose crust")) {
                    Text("Thin").tag("thin")
                    Text("Pan").tag("pan")
                    Text("Deep Dish").tag("deep dish")
                    Text("Cheese-Filled").tag("cheese-filled")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            Divider()
            Button(action: {
                // Creates a custom pizza
                let allChosenToppings = [chosenToppingOne, chosenToppingTwo, chosenToppingThree, chosenToppingFour]
                let customPizza = BuildAPizza(size: chosenSize, toppings: allChosenToppings, crust: chosenCrust)
                // Adds custom pizza to order
                updateBuildAPizzas(addedBuildAPizzaItem: customPizza)
                
            }) {
                Text("Create Pizza")
            }
            .padding()
        }
        
    }
}

struct BuildAPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        BuildAPizzaView()
    }
}