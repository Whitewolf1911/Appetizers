//
//  OrderView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct OrderView: View {

    @State private var orderItems = MockData.orderItems

    var body: some View {
        NavigationView {
            VStack {
                if orderItems.isEmpty {
                    EmptyStateView(
                        imageName: "empty-order",
                        message: "You have no items in your order.\nStart ordering some appetizers!"
                    )
                } else {
                    List {
                        ForEach(orderItems) { appetizer in
                            AppetizerListItemView(appetizer: appetizer)
                        }.onDelete(perform: deleteItems)
                    }.listStyle(.plain)

                    Button {
                        print("Tapped")
                    } label: {
                        Text("Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 260, height: 50)
                            .foregroundColor(.white)
                            .background(Color.brandPrimary)
                            .cornerRadius(10)
                    }.padding(.bottom, 30)
                }

            }
            .navigationTitle("Orders")
        }
    }

    private func deleteItems(atOffsets: IndexSet) {
        orderItems.remove(atOffsets: atOffsets)
    }
}
