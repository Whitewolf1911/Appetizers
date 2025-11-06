//
//  LoadingView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 6.11.2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView().tint(.primaryBrand)
        }
    }
}
