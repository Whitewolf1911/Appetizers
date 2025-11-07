//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 7.11.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    let onDismissClick: () -> Void

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Image("food-placeholder").resizable()
            }.frame(width: 300, height: 225)

            VStack(spacing: 10) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center).padding(.horizontal, 20)
            }.padding(.bottom, 20)
            
            HStack(spacing: 40) {
                VStack(spacing: 5) {
                    Text("Calories")
                        .bold()
                        .font(.caption)

                    Text("\(appetizer.calories)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack(spacing: 5) {
                    Text("Carbs")
                        .bold()
                        .font(.caption)

                    Text("\(appetizer.carbs)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }

                VStack(spacing: 5) {
                    Text("Protein")
                        .bold()
                        .font(.caption)

                    Text("\(appetizer.protein)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }

            Spacer()

            Button {
                print("Tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
            }.padding(.bottom, 30)

        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(
                Button {
                    onDismissClick()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .opacity(0.6)
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.black)
                    }
                },
                alignment: .topTrailing
            )

    }
}
