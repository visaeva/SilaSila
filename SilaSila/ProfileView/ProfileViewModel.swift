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
			if let image = loadImageFromFile() {
				self.selectedImage = image
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
		let fileName = "avatar_\(UUID().uuidString).jpg"
		let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
		
		do {
			if let oldFileName = profile.image {
				let oldFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(oldFileName)
				try? FileManager.default.removeItem(at: oldFileURL)
			}
			try data.write(to: fileURL)
			
			if var user = registrationViewModel.loadUser() {
				user.image = fileName
				let encoded = try JSONEncoder().encode(user)
				UserDefaults.standard.set(encoded, forKey: "registered_user")
				profile.image = fileName
				selectedImage = Image(uiImage: image)
			}
		} catch {
			print("Ошибка сохранения: \(error)")
		}
	}
	
	func deleteImage() {
		if let fileName = profile.image {
			let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
			try? FileManager.default.removeItem(at: fileURL)
		}
		
		if var user = registrationViewModel.loadUser() {
			user.image = nil
			do {
				let encoded = try JSONEncoder().encode(user)
				UserDefaults.standard.set(encoded, forKey: "registered_user")
				profile.image = nil
				selectedImage = nil
			} catch {
				print("Ошибка удаления: \(error)")
			}
		}
	}
	
	private func loadImageFromFile() -> Image? {
		guard let fileName = profile.image,
			  let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName),
			  FileManager.default.fileExists(atPath: fileURL.path),
			  let uiImage = UIImage(contentsOfFile: fileURL.path) else { return nil }
		return Image(uiImage: uiImage)
	}
}


