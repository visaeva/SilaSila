import SwiftUI

class BookingViewModel: ObservableObject {
    @Published var selection: Int = 0
    @Published var numberOfPeople: Int = 1
    @Published var selectedBase: String = "Выберите базу"
    @Published var selectedBoat: String = "Выберите базу"
    @Published var selectedDate: String = "Выберите базу"
    @Published var selectedTime: String = "Выберите базу"
    @Published var participants: [Participant] = []
    let bases: [String] = ["Строгино", "Детский клуб Силы ветра в Строгино", "Пироговское водохранилище (Березки)"]
    let boats: [String] = ["SV20 (4 человека)", "Луч (1 человек)", "SV20 дабл-хенд (2 человека)", "SV20 прогулка (2 места)", "SV20 прогулка (4 места)"]
    let dates: [String] = ["1 августа | Четверг", "2 августа | Пятница", "3 августа | Суббота", "4 августа | Воскресенье", "5 августа | Понедельник", "6 августа | Вторник"]
    let times: [String] = ["10:00", "12:00", "14:00", "15:00", "17:00"]
    
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
        selection = 1
    }
}
