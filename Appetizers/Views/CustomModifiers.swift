//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Ali Basoglu on 11.11.2025.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
