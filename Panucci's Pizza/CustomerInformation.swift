//
//  CustomerInformation.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/2/21.
//

import Foundation

// Customer information
public struct Customer: Identifiable {
    var fullName: String
    var address: String
    var paymentInformation: String
    var phoneNumber: String
    public let id = UUID()
}

// Customer profile for current user
var currentCustomer = Customer(fullName: "Philip J. Fry", address: "Manhattan, Old New York", paymentInformation: "", phoneNumber: "555-555-5555")
