//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AppetizerListView: View {

    @StateObject var viewModel = AppetizersListViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListItemView(appetizer: appetizer)
//                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.onAppetizerClick(appetizer: appetizer)
                        }
                }.listStyle(.plain)
                    .navigationTitle(Text("Appetizers"))
                    .disabled(viewModel.isDetailViewVisible)

            }.blur(radius: viewModel.isDetailViewVisible ? 20 : 0)
                .task {
                    viewModel.getAppetizers()
                }

            if viewModel.isLoading {
                LoadingView()
            }
            if viewModel.isDetailViewVisible {
                AppetizerDetailView(
                    appetizer: viewModel.selectedAppetizer!,
                    onDismissClick: {
                        viewModel.onAppetizerDetailDismissClick()
                    }
                )
            }

        }.alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}
