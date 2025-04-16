//
//  RegistrationView.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import SwiftUI

struct RegistrationView: View {
	@ObservedObject var viewModel = RegistrationViewModel()
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		NavigationStack {
			VStack {
				Text("Личные данные")
					.font(.headline)
					.padding()
				CustomTextField(
					userInput: $viewModel.name,
					placeholder: "Имя",
					placeholderOnTop: "Имя",
					keyboardType: .default,
					autocapitalization: .words,
					validate: ValidationHelper.validateName,
					formatInput: ValidationHelper.filterInput
				)
				CustomTextField(
					userInput: $viewModel.lastName,
					placeholder: "Фамилия",
					placeholderOnTop: "Фамилия",
					keyboardType: .default,
					autocapitalization: .words,
					validate: ValidationHelper.validateSurname,
					formatInput: ValidationHelper.filterInput
				)
				CustomTextField(
					userInput: $viewModel.email,
					placeholder: "Email",
					placeholderOnTop: "Email",
					keyboardType: .emailAddress,
					autocapitalization: .none,
					validate: ValidationHelper.validateMail,
					formatInput: { $0 }
				)
				CustomTextField(
					userInput: $viewModel.phoneNumber,
					placeholder: "Номер телефона",
					placeholderOnTop: "Номер телефона",
					keyboardType: .phonePad,
					autocapitalization: .none,
					validate: ValidationHelper.validateTelephone,
					formatInput: ValidationHelper.formatInputWithMask
				)
				
				
				Text("Биография")
					.font(.headline)
					.padding()
				CustomTextField(
					userInput: $viewModel.bio,
					placeholder: "Расскажите о себе",
					placeholderOnTop: "Биография",
					keyboardType: .default,
					autocapitalization: .sentences,
					validate: ValidationHelper.validateBio,
					formatInput: { $0 }
				)
				.lineLimit(3)
				
				if let errorMessage = viewModel.errorMessage {
					Text(errorMessage)
						.foregroundColor(.red)
						.font(.caption)
						.padding()
				}
				
				Spacer()
				Button(action: {
					viewModel.register()
				}) {
					Text("Зарегистрироваться")
						.font(.title)
						.frame(maxWidth: .infinity)
						.padding()
						.background(viewModel.isFormValid ? Color.black : Color.gray)
						.foregroundColor(.white)
						.cornerRadius(20)
					
				}
				.disabled(!viewModel.isFormValid)
				.padding()
			}
			.navigationTitle("Регистрация")
			.alert("Регистрация успешна!", isPresented: $viewModel.isRegistrationSuccessful) {
				Button("ОК") {
					dismiss()
				}
			}
		}
	}
}

#Preview {
	RegistrationView()
}
