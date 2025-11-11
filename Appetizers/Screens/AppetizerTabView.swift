//
//  ContentView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            OrderView()
                .tabItem { Label("Orders", systemImage: "bag") }
                .badge(order.items.count)
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }.accentColor(.primaryBrand)
    }
}
