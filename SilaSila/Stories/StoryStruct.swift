//
//  StoryStruct.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//

import SwiftUI

struct StoryStruct: Identifiable, Equatable, Hashable {
    let id = UUID()
    let backgroundImage: UIImage
    let title: String
    let description: String
    let backgroundColor: Color
    
    static let story1 = StoryStruct(
        backgroundImage: .stories1,
        title: "Text Text Text Text Text Text Text Text Text Text",
        description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
        backgroundColor: .black
    )
    
    static let story2 = StoryStruct(  backgroundImage: .stories2,
                                      title: "Text Text Text Text Text Text Text Text Text",
                                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      backgroundColor: .black
    )
    
    static let story3 = StoryStruct(  backgroundImage: .stories3,
                                      title: "Text Text Text Text Text Text Text Text Text",
                                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      backgroundColor: .black
    )
    
    static let story4 = StoryStruct(  backgroundImage: .stories1,
                                      title: "Text Text Text Text Text Text Text Text Text",
                                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      backgroundColor: .black
    )
    
}


