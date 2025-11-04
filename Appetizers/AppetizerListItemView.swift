//
//  AppetizerListItemView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AppetizerListItemView: View {
    let appetizer: Appetizer

    var body: some View {
        HStack {
            Image(appetizer.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 80)
                .clipShape(
                    .rect(
                        cornerRadii: .init(
                            topLeading: 8,
                            bottomLeading: 8,
                            bottomTrailing: 8,
                            topTrailing: 8
                        )
                    )
                )
            Spacer().frame(width: 20)
            VStack(alignment: .leading) {
                Text(appetizer.name).font(.headline).fontWeight(.semibold)
                Spacer().frame(height: 4)
                Text("$" + appetizer.price.formatted()).font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
