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
    var addedItems = [String: Any]()
    var orderTotal: Int
    var payWithCash: Bool
    var pickup: Bool
    public let id = UUID()
}

// MARK: - Order functions that will add food names and prices to total
// Add food item to order
public func addToOrder(addedItem: Any?, addedPrice: Int) {
    customerOrder.orderTotal += addedPrice
    switch addedItem {
    case is BuildAPizza:
        if let addedItem = customerOrder.addedItems(.key)
    }
}

// Customer order
public var customerOrder = Order(addedItems: [:], orderTotal: 0, payWithCash: true, pickup: true)

