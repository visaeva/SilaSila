//
//  ProgressBar.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//


import SwiftUI

struct ProgressBar: View {
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(width: geometry.size.width,
                           height: .progressBarHeight)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(width: min (progress * geometry.size.width,
                                       geometry.size.width),
                           height: .progressBarHeight)
                    .foregroundColor(.blue)
                
            }
            .mask {
                MaskView(numberOfSections: numberOfSections)
            }
        }
    }
}

#Preview {
    Color.black
        .ignoresSafeArea()
        .overlay(
            ProgressBar(numberOfSections: 5, progress: 0.5)
                .padding()
        )
}
