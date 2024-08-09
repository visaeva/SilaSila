//
//  MaskView.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//

import SwiftUI


struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()}
        }
    }
}

#Preview {
    Color.black
        .ignoresSafeArea()
        .overlay(
            MaskView(numberOfSections: 5)
                .padding()
        )
}

