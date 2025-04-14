import SwiftUI

class ProfileViewModel: ObservableObject {
	
	@Published var profile: ProfileStruct =  ProfileStruct(
		image: "avatar",
		name: "Иван",
		lastName: "Иванов",
		bio: "Дизайнер",
		phoneNumber: "8-999-999-99-99",
		email: "ivanivanov@gmail.com"
	)
	
}
