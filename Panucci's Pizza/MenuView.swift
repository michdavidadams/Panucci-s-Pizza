//
//  MenuView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            PizzasView().tabItem { Text("Pizzas") }.tag(0)
            SidesView().tabItem { Text("Sides") }.tag(1)
            DrinksView().tabItem { Text("Drinks") }.tag(2)
            CheckoutView().tabItem { Text("Checkout") }.tag(3)
        }
        .frame(minWidth: 800, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity, alignment: .center)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
