//
//  Order.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/1/21.
//

import Foundation

// This is where the user's order will be created and stored
// Order struct
public struct Order {
    var foodItem: [String]
    var orderTotal: Int
    var payWithCash: Bool
    var pickup: Bool
    public let id = UUID()
}

// MARK: Order functions that will add food names and prices to total
// Add Build-A-Pizza to order
public func updateBuildAPizzas(addedBuildAPizzaItem: BuildAPizza) {
    customerOrder.foodItem.append("A \(addedBuildAPizzaItem.size) \(addedBuildAPizzaItem.crust)-crust pizza with \(addedBuildAPizzaItem.toppings)")
}

// Add Item to order
public func updatePizzas(addedPizza: Pizza) {
    customerOrder.foodItem.append("\(addedPizza.name)")
    customerOrder.orderTotal += addedPizza.price
}
// Add drink to order
public func updateDrinks(addedDrink: Drinks, drinkSize: String) {
    customerOrder.foodItem.append("\(drinkSize) \(addedDrink.name)")
    switch drinkSize {
    case "small": customerOrder.orderTotal += addedDrink.prices[0]
    case "medium": customerOrder.orderTotal += addedDrink.prices[1]
    case "large": customerOrder.orderTotal += addedDrink.prices[2]
    default: customerOrder.orderTotal += addedDrink.prices[0]
    }
}

// Add side to order
public func updateSides(addedSide: Sides) {
    customerOrder.foodItem.append("\(addedSide.name)")
    customerOrder.orderTotal += addedSide.price
}

// Customer order
public var customerOrder = Order(foodItem: [""], orderTotal: 0, payWithCash: true, pickup: true)

