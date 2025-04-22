import SwiftUI

class BookingViewModel: ObservableObject {
	@Published var selection: Int = 0
	@Published var numberOfPeople: Int = 1
	@Published var selectedBase: String = "Выберите базу"
	@Published var selectedBoat: String = "Выберите базу"
	@Published var selectedDate: Date = Date()
	@Published var selectedDateString: String = "Выберите базу"
	@Published var selectedTime: String = "Выберите базу"
	@Published var participants: [Participant] = []
	let bases: [String] = ["Строгино", "Детский клуб Силы ветра в Строгино", "Пироговское водохранилище (Березки)"]
	let boats: [String] = ["SV20 (4 человека)", "Луч (1 человек)", "SV20 дабл-хенд (2 человека)", "SV20 прогулка (2 места)", "SV20 прогулка (4 места)"]
	let times: [String] = ["10:00", "12:00", "14:00", "15:00", "17:00"]
	
	
	var dates: [String] {
		var dates: [String] = []
		let calendar = Calendar.current
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "ru_RU")
		formatter.dateFormat = "d MMMM | EEEE"
		
		var currentDate = calendar.startOfDay(for: Date())
		let endDate = calendar.date(byAdding: .year, value: 1, to: currentDate)!
		
		while currentDate <= endDate {
			dates.append(formatter.string(from: currentDate))
			currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
		}
		return dates
	}
	
	func date(from string: String) -> Date? {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "ru_RU")
		formatter.dateFormat = "d MMMM | EEEE"
		return formatter.date(from: string)
	}
	
	var formattedDate: String {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "ru_RU")
		formatter.dateFormat = "d MMMM | EEEE"
		return formatter.string(from: selectedDate)
	}
	
	var isDateValid: Bool {
		let calendar = Calendar.current
		let today = calendar.startOfDay(for: Date())
		let selected = calendar.startOfDay(for: selectedDate)
		return selected >= today
	}
	
	var isFormValid: Bool {
		selectedBase != "Выберите базу" &&
		selectedBoat != "Выберите базу" &&
		selectedTime != "Выберите базу" &&
		selectedDateString != "Выберите базу" &&
		isDateValid &&
		numberOfPeople > 0
	}
	
	func stepTitle(for index: Int) -> String {
		switch index {
		case 0: return "ВЫБОР ДАТ"
		case 1: return "УЧАСТНИКИ"
		case 2: return "ПОДТВЕРЖДЕНИЕ"
		case 3: return "ОПЛАТА"
		case 4: return "ЗАВЕРШЕНИЕ"
		default: return ""
		}
	}
	
	func onNext() {
		if isFormValid {
			selection = 1
		}
	}
}
