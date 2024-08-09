//
//  MaskFragmentView.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//

import SwiftUI

struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: .progressBarHeight)
            .foregroundStyle(.white)
    }
}

#Preview {
    MaskFragmentView()
}

extension CGFloat {
    static let progressBarCornerRadius: CGFloat = 3
    static let progressBarHeight: CGFloat = 6
}
