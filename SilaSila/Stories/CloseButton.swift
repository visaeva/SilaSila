//
//  CloseButton.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding()
    }
}
