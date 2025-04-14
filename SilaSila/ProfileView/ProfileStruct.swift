import SwiftUI

struct ProfileStruct: Hashable, Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var lastName: String
    var bio: String
    var phoneNumber: String
    var email: String
}
