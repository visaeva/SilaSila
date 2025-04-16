//
//  CustomTextField.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import SwiftUI

struct CustomTextField: View {
	@Binding var userInput: String
	@FocusState private var isFocused: Bool
	@State private var supportingText: String?
	
	let placeholder: String
	let placeholderOnTop: String?
	let keyboardType: UIKeyboardType
	let autocapitalization: UITextAutocapitalizationType
	let validate: (String) -> String?
	let formatInput: (String) -> String
	
	private let width: CGFloat = UIScreen.main.bounds.width / 1.1
	private let height: CGFloat = UIScreen.main.bounds.height / 15
	
	private var displayPlaceholderOnTop: String {
		placeholderOnTop ?? placeholder
	}
	
	var body: some View {
		VStack(alignment: .leading) {
			ZStack {
				TextField(
					placeholder,
					text: $userInput,
					prompt: Text(placeholder).foregroundStyle(.gray.opacity(0.5))
				)
				.focused($isFocused)
				.keyboardType(keyboardType)
				.autocapitalization(autocapitalization)
				.padding(.horizontal, 16)
				.frame(width: width, height: height)
				.overlay(
					RoundedRectangle(cornerRadius: 8)
						.stroke(determineBorderColor(), lineWidth: 1)
				)
				.background(Color.white)
			}
			.overlay(
				Text(displayPlaceholderOnTop)
					.font(.caption)
					.foregroundColor(determineBorderColor())
					.padding(.horizontal, 8)
					.background(Color.white)
					.clipShape(RoundedRectangle(cornerRadius: 4))
					.offset(x: 16, y: -8)
					.opacity(userInput.isEmpty && !isFocused ? 0 : 1),
				alignment: .topLeading
			)
			.onChange(of: userInput) { _, newValue in
				let formatted = formatInput(newValue)
				userInput = formatted
				supportingText = validate(formatted)
			}
			.onChange(of: isFocused) { _, newValue in
				if !newValue {
					supportingText = validate(userInput)
				}
			}
			.onTapGesture {
				isFocused = true
			}
			if let supportingText = supportingText, !userInput.isEmpty {
				Text(supportingText)
					.font(.caption)
					.foregroundColor(.red)
					.padding(.leading, 16)
			}
		}
	}
	
	private func determineBorderColor() -> Color {
		if supportingText != nil && !userInput.isEmpty {
			return .red
		} else if isFocused || !userInput.isEmpty {
			return .blue
		} else {
			return .gray
		}
	}
}
