//
//  MenuView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Menu screen

import SwiftUI

struct MenuView: View {
    
    var body: some View {
            // Tab view containing each menu section
            TabView {
                CustomPizzaView().tabItem { Text("Build-A-Pizza") }.tag(0)
                PizzasView().tabItem { Text("Pizzas") }.tag(1)
                SidesView().tabItem { Text("Sides") }.tag(2)
                DrinksView().tabItem { Text("Drinks") }.tag(3)
                CheckoutView().tabItem { Text("Checkout") }.tag(4)
            }
            .frame(minWidth: 800, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity, alignment: .center)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
