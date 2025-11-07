//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AppetizerListView: View {

    @StateObject var viewModel = AppetizersListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListItemView(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }.navigationTitle(Text("Appetizers"))
                    .disabled(isShowingDetail)

            }.blur(radius: isShowingDetail ? 20 : 0)

            if viewModel.isLoading {
                LoadingView()
            }
            if isShowingDetail {
                AppetizerDetailView(
                    appetizer: selectedAppetizer!,
                    onDismissClick: {
                        isShowingDetail = false
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
