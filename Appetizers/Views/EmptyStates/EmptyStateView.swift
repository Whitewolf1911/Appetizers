//
//  EmptyOrderView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 10.11.2025.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName: String
    let message: String

    var body: some View {
        ZStack(alignment: .center) {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)

                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}
