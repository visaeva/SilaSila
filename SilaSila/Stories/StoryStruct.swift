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
		backgroundImage: .story11,
		title: "Каникулы в Турции",
		description: "Уединенные бухты, античные руины и совсем другая Турция под парусами",
		backgroundColor: .black
	)
	
	static let story2 = StoryStruct(  backgroundImage: .story12,
									  title: "Дальний Восток",
									  description: "Маяки, дикие острова и гребешки с июня по сентябрь",
									  backgroundColor: .black
	)
	
	static let story3 = StoryStruct(  backgroundImage: .story13,
									  title: "Выгодные абонементы",
									  description: "Добавляем + 15% к сумме вашего абонемента",
									  backgroundColor: .black
	)
	
	static let story4 = StoryStruct(  backgroundImage: .story11,
									  title: "События",
									  description: "Лекции, встречи, открытые уроки и планы на сезон",
									  backgroundColor: .black
	)
	
}


