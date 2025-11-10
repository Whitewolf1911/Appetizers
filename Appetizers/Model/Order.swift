//
//  Order.swift
//  Appetizers
//
//  Created by Ali Basoglu on 10.11.2025.
//

import Combine
import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }

    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(atOffsets: IndexSet) {
        items.remove(atOffsets: atOffsets)
    }
}
