//
//  DrinksView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Drinks screen

import SwiftUI

struct DrinksView: View {
    @State var chosenPrice = 12
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(allDrinks) { drink in
                    HStack {
                        Image(drink.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(drink.name)
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .frame(width: 100.0)
                                .multilineTextAlignment(.center)
                            VStack(alignment: .center) {
                                ForEach(drink.prices.keys.sorted(), id: \.self) { key in
                                    HStack {
                                        Text("\(key) oz:")
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Text("$\(drink.prices[key] ?? 0)")
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.trailing)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text(drink.description)
                            .fontWeight(.ultraLight)
                            .multilineTextAlignment(.leading)
                            .frame(width: 180.0)
                        
                        VStack(alignment: .trailing) {
                            Picker(selection: $chosenPrice, label: Text("Select size")) {
                                ForEach(drink.prices.keys.sorted(), id: \.self) { key in
                                    Text("\(key)").tag(key)
                                }
                            }
                            .frame(width: 165.0)
                            Button(action: {
                                print("\(drink.name) added to order. ")
                                let addedDrink = OrderItem(type: .drink, price: drink.prices[chosenPrice] ?? 0, details: "\(drink.name)")
                                addToOrder(addedItem: addedDrink)
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

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView()
    }
}
