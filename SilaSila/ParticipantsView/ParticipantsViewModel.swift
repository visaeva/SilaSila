import SwiftUI

class ParticipantsViewModel: ObservableObject {
    @Published var participants: [Participant] = [
        Participant(name: "", lastName: "", phoneNumber: "", email: "", selectedExperience: "Нет опыта", selectedDate: Date()),
        Participant(name: "", lastName: "", phoneNumber: "", email: "", selectedExperience: "Нет опыта", selectedDate: Date()),
        Participant(name: "", lastName: "", phoneNumber: "", email: "", selectedExperience: "Нет опыта", selectedDate: Date())
    ]
    
    @Published var showAdditionalParticipants: Bool = false
    @Published var confirmation: Bool = false
    
    let experiences = ["Нет опыта", "Знаю базовое устройство яхты", "Умею настраивать паруса", "Хожу всеми курсами и могу пришвартоваться", "Совершенствую технику в деталях", "Предвижу ветер и ситуации на воде", "Готовлюсь к победе в гонках", "Парусный мастер, изучаю стратегию и тактику"]
}

extension String {
    func formatPhoneNumber() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let prefix = "+7"
        var numberWithoutPrefix = cleanNumber
        
        if numberWithoutPrefix.hasPrefix("8") {
            numberWithoutPrefix.removeFirst()
        } else if numberWithoutPrefix.hasPrefix("7") {
            numberWithoutPrefix.removeFirst()
        }
        if numberWithoutPrefix.isEmpty {
            return prefix
        }
        
        let mask = "(XXX) XXX-XXXX"
        
        var result = prefix
        var startIndex = numberWithoutPrefix.startIndex
        var endIndex = numberWithoutPrefix.endIndex
        
        result.append(" ")
        
        for char in mask {
            if startIndex < endIndex {
                if char == "X" {
                    result.append(numberWithoutPrefix[startIndex])
                    startIndex = numberWithoutPrefix.index(after: startIndex)
                } else {
                    result.append(char)
                }
            } else {
                break
            }
        }
        
        return result
    }
}

