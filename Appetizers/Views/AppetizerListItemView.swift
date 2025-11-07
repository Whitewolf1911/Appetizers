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
            AsyncImage(url: URL(string: appetizer.imageURL)){image in
                image.resizable()
            } placeholder: {
                Image("food-placeholder").resizable()
            }.frame(width: 100, height: 80)
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
                .aspectRatio(contentMode: .fit)
               
        
             
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
