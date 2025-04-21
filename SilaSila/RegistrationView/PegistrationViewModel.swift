//
//  PegistrationViewModel.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
	@Published var name: String = ""
	@Published var lastName: String = ""
	@Published var email: String = ""
	@Published var phoneNumber: String = ""
	@Published var bio: String = ""
	@Published var isRegistrationSuccessful: Bool = false
	@Published var errorMessage: String?
	
	private let userDefaultsKey = "registered_user"
	private let isRegisteredKey = "isRegistered"
	
	var isFormValid: Bool {
		ValidationHelper.validateName(name: name) == nil &&
		ValidationHelper.validateSurname(surname: lastName) == nil &&
		ValidationHelper.validateMail(mail: email) == nil &&
		ValidationHelper.validateTelephone(telephone: phoneNumber) == nil &&
		ValidationHelper.validateBio(bio: bio) == nil
	}
	
	func register() {
		guard isFormValid else {
			errorMessage = "Пожалуйста, заполните все поля корректно."
			return
		}
		
		let user = User(
			name: name,
			lastName: lastName,
			email: email,
			phoneNumber: phoneNumber,
			bio: bio
		)
		
		do {
			let data = try JSONEncoder().encode(user)
			UserDefaults.standard.set(data, forKey: userDefaultsKey)
			UserDefaults.standard.set(true, forKey: isRegisteredKey)
			isRegistrationSuccessful = true
			errorMessage = nil
		} catch {
			errorMessage = "Ошибка при сохранении данных: \(error.localizedDescription)"
		}
	}
	
	func loadUser() -> User? {
		guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else { return nil }
		do {
			let user = try JSONDecoder().decode(User.self, from: data)
			return user
		} catch {
			print("Ошибка при загрузке данных: \(error)")
			return nil
		}
	}
}
