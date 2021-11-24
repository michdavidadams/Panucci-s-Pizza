//
//  Order.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/1/21.
//

import Foundation

// Food types
enum FoodType {
    case customPizza
    case pizza
    case side
    case drink
}

// Order item
public struct OrderItem: Identifiable, Hashable {
    var type: FoodType
    var price: Int
    var details: String
    public let id = UUID()
}

// This is where the user's order will be created and stored
// Order struct
public struct Order: Identifiable {
    var addedItems: [OrderItem?]
    var orderTotal: Int
    var payWithCash: Bool
    var pickup: Bool
    public let id = UUID()
}

// MARK: - Order functions that will add food names and prices to total
// Add food item to order
public func addToOrder(addedItem: OrderItem) {
    customerOrder.addedItems.append(addedItem)
    customerOrder.orderTotal += addedItem.price
}

// Customer order
public var customerOrder = Order(addedItems: [], orderTotal: 0, payWithCash: true, pickup: true)

