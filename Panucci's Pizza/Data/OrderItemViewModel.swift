//
//  FoodViewModel.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 11/25/21.
//

import Foundation
import SwiftUI

class OrderItemViewModel: ObservableObject {
    @Published var order = customerOrder.addedItems
}

struct OrderItemView: View {
    var order: Order
    @ObservedObject var viewModel = OrderItemViewModel()
    
    var body: some View {
        Text("\(viewModel.order)" as String)
            .padding()
    }
}
