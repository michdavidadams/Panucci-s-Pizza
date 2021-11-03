//
//  Food.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import Foundation

// This is the food that will be displayed in the user interface
// MARK: Pizzas
public struct Pizza: Identifiable {
    let name: String
    let price: Int
    let description: String
    let image: String
    public let id = UUID()
    
}

let allPizzas = [
    Pizza(name: "Cheese Pizza", price: 6, description: "Our signature three-cheese pizza. Perfect for picky eaters, children's parties, and people who enjoy vanilla ice cream.", image: "front-view-pizza-with-cheese-brown-round-wooden-desk-dark-surface"),
    Pizza(name: "Veggie Lover's Pizza", price: 7, description: "A must-have for people too sophisticated for bland cheese pizza. Instead, sink your teeth into the delectable slimy olives with the mushy tomatoes.", image: "top-view-mixed-pizza-with-tomato-black-olive-melted-cheese"),
    Pizza(name: "Veggie Hater's Pizza", price: 7, description: "In the mood for something with lots of meat and no greens? Look no further!", image: "top-view-salami-pizza-with-cheese-pepperoni-wooden-table")
]

// MARK: Drinks
public struct Drinks: Identifiable {
    let name: String
    let price: Int
    let description: String
    let image: String
    public let id = UUID()
    
}

let allDrinks = [
    Drinks(name: "Soda", price: 1, description: "The perfect complement to any pizza. So perfect, in fact, that we considered making it the only drink available.", image: "fresh-cola-drink-glass"),
    Drinks(name: "Water", price: 1, description: "Like the water from your tap, only better!", image: "clear-glass-with-water"),
    Drinks(name: "Sweet Tea", price: 1, description: "A Southern delicacy.", image: "refreshing-drink"),
    Drinks(name: "Unsweet Tea", price: 1, description: "Like Sweet Tea, only worse!", image: "refreshing-drink"),
    Drinks(name: "Lemonade", price: 1, description: "Tastes so good, you'll forget it's decaying your teeth.", image: "refreshing-drink-1")
]

// MARK: Sides
public struct Sides: Identifiable {
    let name: String
    let price: Int
    let description: String
    let image: String
    public let id = UUID()
    
}

let allSides = [
    Sides(name: "Breadsticks", price: 3, description: "It's just bread in stick form. Yay, bread!", image: "mozzarella-sticks-cutting-desk"),
    Sides(name: "Garlic Bread", price: 2, description: "A great side dish for a first date.", image: "homemade-tasty-bread-with-garlic-cheese-herbs-kitchen-table"),
    Sides(name: "Pasta", price: 5, description: "Our county-famous pasta, with marinara sauce. Hold your expectations.", image: "comida-lifestyle-spaghetti-foodie-gastronomy")
]
