import SwiftUI

class ProfileViewModel: ObservableObject {
	
	@Published var profile: ProfileStruct
	
	@Published var selectedImage: Image? = nil
	private let registrationViewModel = RegistrationViewModel()
	
	
	init() {
		if let user = registrationViewModel.loadUser() {
			self.profile = ProfileStruct(
				id: UUID(),
				image: user.image,
				name: user.name,
				lastName: user.lastName,
				bio: user.bio,
				phoneNumber: user.phoneNumber,
				email: user.email
			)
			if let base64String = user.image,
			   let data = Data(base64Encoded: base64String),
			   let uiImage = UIImage(data: data) {
				self.selectedImage = Image(uiImage: uiImage)
			}
		} else {
			self.profile = ProfileStruct(
				image: nil,
				name: "Иван",
				lastName: "Иванов",
				bio: "Дизайнер",
				phoneNumber: "8-999-999-99-99",
				email: "ivanivanov@gmail.com"
			)
		}
	}
	func saveImage(_ image: UIImage) {
		guard let data = image.jpegData(compressionQuality: 0.8) else { return }
		let base64String = data.base64EncodedString()
		if var user = registrationViewModel.loadUser() {
			user.image = base64String
			do {
				let encoded = try JSONEncoder().encode(user)
				UserDefaults.standard.set(encoded, forKey: "registered_user")
				profile.image = base64String
				selectedImage = Image(uiImage: image)
			} catch {
				
			}
		}
	}
	
	func deleteImage() {
		if var user = registrationViewModel.loadUser() {
			user.image = nil
			do {
				let encoded = try JSONEncoder().encode(user)
				UserDefaults.standard.set(encoded, forKey: "registered_user")
				profile.image = nil
				selectedImage = nil
			} catch {
				
			}
		}
	}
}


