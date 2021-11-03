//
//  PizzasView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import SwiftUI

struct PizzasView: View {
    
    var body: some View {
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
                            .dynamicTypeSize(.large)
                            .multilineTextAlignment(.center)
                        
                        Text("$\(pizza.price) per pizza")
                            .fontWeight(.semibold)
                            .dynamicTypeSize(.medium)
                    }
                    .padding(.horizontal)
                    
                    Text(pizza.description)
                        .fontWeight(.ultraLight)
                        .dynamicTypeSize(.small)
                        .multilineTextAlignment(.leading)
                        .frame(width: 180.0)
                    
                    Button(action: {
                        print("\(pizza.name) added to order. ")
                        updatePizzas(addedPizza: pizza)
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

struct PizzasView_Previews: PreviewProvider {
    static var previews: some View {
        PizzasView()
        
    }
}
