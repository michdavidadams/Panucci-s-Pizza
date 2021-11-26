//
//  PizzasView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Pizzas screen

import SwiftUI

struct PizzasView: View {
    
    // Default chosen pizza size
    @State var chosenSize = "small"
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(allPizzas) { pizza in
                    HStack {
                        Image(pizza.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(pizza.name)
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .frame(width: 100.0)
                                .multilineTextAlignment(.center)
                            VStack(alignment: .center) {
                                ForEach(pizza.prices.keys.sorted(), id: \.self) { key in
                                    HStack {
                                        Text("\(key):")
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Text("$\(pizza.prices[key] ?? 0)")
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.trailing)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text(pizza.description)
                            .fontWeight(.ultraLight)
                            .multilineTextAlignment(.leading)
                            .frame(width: 180.0)
                        
                        VStack(alignment: .trailing) {
                            Picker(selection: $chosenSize, label: Text("Select size")) {
                                ForEach(pizza.prices.keys.sorted(), id: \.self) { key in
                                    Text("\(key)").tag(key)
                                }
                            }
                            .frame(width: 165.0)
                            Button(action: {
                                print("\(pizza.name) added to order. ")
                                let addedPizza = OrderItem(type: .pizza, price:     pizza.prices[chosenSize] ?? 0, details: "\(pizza.name)")
                                addToOrder(addedItem: addedPizza)
                            }) {
                                Text("Add to order")
                            }
                        }
                        .padding()
                        
                    }
                    Divider()
                }
            }
        }
    }
}

struct PizzasView_Previews: PreviewProvider {
    static var previews: some View {
        PizzasView()
        
    }
}
