//
//  Activities.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import SwiftUI

struct Activities: Identifiable, Codable {
	let id: UUID
	let name: String
	let imageName: String
	var favourite: Bool
	var description: String
}


class ActivitiesViewModel: ObservableObject {
	@Published var activities: [Activities]
	private let favouriteKey = "favourite_activities"
	
	init() {
		let defaultActivities = [
			Activities(id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!, name: "Глэмпинг", imageName: "glamping", favourite: false, description: "Отдохните в стильных домиках из морских контейнеров с пейзажами на берегу Пироговского водохранилища всего в получасе езды от столицы"),
			Activities(id: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!, name: "Парусный лагерь", imageName: "lighthouse", favourite: false, description: "Погрузитесь в мир парусного спорта, научитесь управлять яхтой и наслаждайтесь морскими приключениями"),
			Activities(id: UUID(uuidString: "00000000-0000-0000-0000-000000000003")!, name: "Камчатка. Экспедиция на яхте", imageName: "kamchatka", favourite: false, description: "Исследуйте дикую природу Камчатки, путешествуя на комфортабельной яхте вдоль вулканов и гейзеров"),
			Activities(id: UUID(uuidString: "00000000-0000-0000-0000-000000000004")!, name: "Каникулы в Италии", imageName: "pisa", favourite: false, description: "Проведите незабываемые каникулы в Италии, наслаждаясь культурой, кухней и историческими достопримечательностями")
		]
		
		let favouriteIDs = UserDefaults.standard.array(forKey: favouriteKey) as? [String] ?? []
		self.activities = defaultActivities.map { activity in
			var updatedActivity = activity
			updatedActivity.favourite = favouriteIDs.contains(activity.id.uuidString)
			return updatedActivity
		}
	}
	
	func toggleFavourite(at index: Int) {
		guard index >= 0 && index < activities.count else { return }
		activities[index].favourite.toggle()
		
		let favouriteIDs = activities.filter { $0.favourite }.map { $0.id.uuidString }
		UserDefaults.standard.set(favouriteIDs, forKey: favouriteKey)
	}
}
