//
//  Activities.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import SwiftUI

struct Activities: Identifiable {
	let id = UUID()
	let name: String
	let imageName: String
	var favourite: Bool
}


class ActivitiesViewModel: ObservableObject {
	@Published var activities: [Activities] = [
		Activities(name: "Глэмпинг", imageName: "glamping", favourite: true),
		Activities(name: "Парусный лагерь", imageName: "lighthouse", favourite: false),
		Activities(name: "Камчатка. Экспедиция на яхте", imageName: "kamchatka", favourite: false),
		Activities(name: "Каникулы в Италии", imageName: "pisa", favourite: false)
	]
	
	func toggleFavourite(at index: Int) {
		guard index >= 0 && index < activities.count else { return }
		activities[index].favourite.toggle()
	}
}
