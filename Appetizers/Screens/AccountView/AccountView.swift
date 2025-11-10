//
//  AccountView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AccountView: View {

    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)

                    TextField("Last Name", text: $viewModel.user.lastName)

                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)

                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.birthdate,
                        displayedComponents: DatePickerComponents
                            .date
                    )

                    Button {
                        viewModel.onSaveClick()
                    } label: {
                        Text("Save changes")
                    }
                }

                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)

                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }.tint(.brandPrimary)
            }
            .navigationTitle(Text("Account"))
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton
                )
            }
        }
    }
}
