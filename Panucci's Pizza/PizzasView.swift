//
//  PizzasView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Pizzas screen

import SwiftUI

struct PizzasView: View {
    
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
                            
                            Text("Small: $\(pizza.price)")
                                .fontWeight(.semibold)
                            Text("Medium: $\(pizza.price * 2)")
                                .fontWeight(.semibold)
                            Text("Large: $\(pizza.price * 3)")
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal)
                        
                        Text(pizza.description)
                            .fontWeight(.ultraLight)
                            .multilineTextAlignment(.leading)
                            .frame(width: 180.0)
                        Picker(selection: pizza.price, label: Text("Select size")) {
                            Text("Small").tag(1)
                            Text("Medium").tag(2)
                            Text("Large").tag(3)
                        }
                        Button(action: {
                            print("\(pizza.name) added to order. ")
                            addToOrder(addedItem: pizza, addedPrice: 0)
                        }) {
                            Text("Add to order")
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
