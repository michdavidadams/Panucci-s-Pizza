//
//  Order.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/1/21.
//

import Foundation

// This is where the user's order will be created and stored
// Order struct
public class Order {
    var foodItem: String
    var orderTotal: Int
    var payWithCash: Bool
    var pickup: Bool
    public let id = UUID()
    
    init(foodItem: String, orderTotal: Int, payWithCash: Bool, pickup: Bool) {
        self.foodItem = foodItem
        self.orderTotal = orderTotal
        self.payWithCash = payWithCash
        self.pickup = pickup
    }
}

// MARK: Order functions that will add food names and prices to total
// Add pizza to order
public func updatePizzas(addedPizza: Pizza) {
    customerOrder.foodItem += "\(addedPizza.name), "
    customerOrder.orderTotal += addedPizza.price
}
// Add drink to order
public func updateDrinks(addedDrink: Drinks) {
    customerOrder.foodItem += "\(addedDrink.name), "
    customerOrder.orderTotal += addedDrink.price
}
// Add side to order
public func updateSides(addedSide: Sides) {
    customerOrder.foodItem += "\(addedSide.name), "
    customerOrder.orderTotal += addedSide.price
}

// Customer order
public var customerOrder = Order(foodItem: "", orderTotal: 0, payWithCash: true, pickup: true)
