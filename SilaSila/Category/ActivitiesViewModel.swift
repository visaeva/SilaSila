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
	var description: String
}


class ActivitiesViewModel: ObservableObject {
	@Published var activities: [Activities] = [
		Activities(name: "Глэмпинг", imageName: "glamping", favourite: true, description: "Отдохните в стильных домиках из морских контейнеров с пейзажами на берегу Пироговского водохранилища всего в получасе езды от столицы"),
		Activities(name: "Парусный лагерь", imageName: "lighthouse", favourite: false, description: "Погрузитесь в мир парусного спорта, научитесь управлять яхтой и наслаждайтесь морскими приключениями"),
		Activities(name: "Камчатка. Экспедиция на яхте", imageName: "kamchatka", favourite: false, description: "Исследуйте дикую природу Камчатки, путешествуя на комфортабельной яхте вдоль вулканов и гейзеров"),
		Activities(name: "Каникулы в Италии", imageName: "pisa", favourite: false, description: "Проведите незабываемые каникулы в Италии, наслаждаясь культурой, кухней и историческими достопримечательностями")
	]
	
	func toggleFavourite(at index: Int) {
		guard index >= 0 && index < activities.count else { return }
		activities[index].favourite.toggle()
	}
}
