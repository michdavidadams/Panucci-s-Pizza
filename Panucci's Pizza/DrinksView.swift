//
//  DrinksView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import SwiftUI

struct DrinksView: View {
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
                                .dynamicTypeSize(.large)
                                .multilineTextAlignment(.center)
                            
                            Text("$\(drink.price) per drink")
                                .fontWeight(.semibold)
                                .dynamicTypeSize(.medium)
                        }
                        .padding(.horizontal)
                        
                        Text(drink.description)
                            .fontWeight(.ultraLight)
                            .dynamicTypeSize(.small)
                            .multilineTextAlignment(.leading)
                            .frame(width: 180.0)
                        
                        Button(action: {
                            print("\(drink.name) added to order. ")
                            updateDrinks(addedDrink: drink)
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

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView()
    }
}
