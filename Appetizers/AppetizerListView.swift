//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers){ appetizer in
                AppetizerListItemView(appetizer: appetizer)
            }.navigationTitle(Text("Appetizers"))
        }
    }
}
