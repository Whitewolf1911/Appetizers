//
//  NutritionInfoView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 7.11.2025.
//

import SwiftUI

struct NutritionInfoView: View {
    let label: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(label)
                .bold()
                .font(.caption)

            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
