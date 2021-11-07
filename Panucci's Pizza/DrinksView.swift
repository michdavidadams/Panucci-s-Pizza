//
//  DrinksView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Drinks screen

import SwiftUI

struct DrinksView: View {
    // Drink size
    @State var drinkSize = "small"
    
    var body: some View {
        
        // View that allows vertical scrolling through all drinks
        ScrollView {
            LazyVStack {
                
                // ForEach for all available drinks
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
                                .font(.title)
                                .fontWeight(.bold)
                                .dynamicTypeSize(.large)
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                            Text(drink.description)
                                .fontWeight(.ultraLight)
                                .dynamicTypeSize(.small)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding(.horizontal)
                        .frame(width: 300.0)
                        
                        VStack {
                            Picker(selection: $drinkSize, label: Text("Size")) {
                                Text("small: $\(drink.prices[0])").tag("small")
                                Text("medium: $\(drink.prices[1])").tag("medium")
                                Text("large: $\(drink.prices[2])").tag("large")
                            }
                            .padding()
                            .frame(width: 160.0)
                            
                            
                            Button(action: {
                                print("\(drink.name) added to order.")
                                updateDrinks(addedDrink: drink, drinkSize: "\(drinkSize)")
                            }) {
                                Text("Add to order")
                            }
                            .padding()
                        }
                        .padding(.leading)
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
