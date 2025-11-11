//
//  AccountView.swift
//  Appetizers
//
//  Created by Ali Basoglu on 4.11.2025.
//

import SwiftUI

struct AccountView: View {

    @StateObject var viewModel = AccountViewModel()

    @FocusState private var focusedTextField: FormTextField?

    enum FormTextField {
        case firstName
        case lastName
        case email
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused(
                            $focusedTextField,
                            equals: .firstName
                        ).onSubmit { focusedTextField = .lastName }
                        .submitLabel(
                            .next
                        )

                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused(
                            $focusedTextField,
                            equals: .lastName
                        ).onSubmit { focusedTextField = .email }.submitLabel(
                            .next
                        )

                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never).focused(
                            $focusedTextField,
                            equals: .email
                        )
                        .onSubmit { focusedTextField = nil }.submitLabel(
                            .continue
                        )

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

                    Toggle(
                        "Frequent Refills",
                        isOn: $viewModel.user.frequentRefills
                    )
                }.tint(.brandPrimary)
            }
            .navigationTitle(Text("Account"))
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }

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
