import SwiftUI

struct Participant: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var selectedExperience: String
    var selectedDate: Date
}
