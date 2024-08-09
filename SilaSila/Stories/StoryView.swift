//
//  StoryView.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//

import SwiftUI

struct StoryView: View {
    let story: StoryStruct
    
    var body: some View {
        story.backgroundColor
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Image(uiImage: story.backgroundImage)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 16) {
                            Text(story.title)
                                .font(.title)
                                .foregroundColor(.white)
                                .lineLimit(2)
                            Text(story.description)
                                .font(.title3)
                                .lineLimit(3)
                                .foregroundColor(.white)
                        }
                        .padding(.init(top:0, leading:16, bottom: 40, trailing: 36))
                    }
                }
            )
    }
}



#Preview {
    StoryView(story: .story1)
}
