//
//  OrderView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct OrderView: View {

    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            VStack {
                if order.items.isEmpty {
                    EmptyStateView(
                        imageName: "empty-order",
                        message:
                            "You have no items in your order.\nStart ordering some appetizers!"
                    )
                } else {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListItemView(appetizer: appetizer)
                        }.onDelete(perform: order.deleteItems)
                    }.listStyle(.plain)

                    Button {
                        //TODO:
                        print("Tapped")
                    } label: {
                        Text(
                            "$\(order.totalPrice, specifier:"%.2f") - Place Order"
                        )
                    }.padding(.bottom, 30).modifier(StandardButtonStyle())
                }

            }
            .navigationTitle("Orders")
        }
    }

}
