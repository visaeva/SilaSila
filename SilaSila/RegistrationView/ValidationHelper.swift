//
//  ValidationHelper.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import Foundation

enum ConstantsString {
	static let nameLength = "Имя должно содержать от 1 до 64 символов"
	static let phoneNumberInvalid = "Номер телефона должен содержать 11 цифр"
	static let invalidEmail = "Некорректный email"
	static let bioLength = "Биография должна содержать от 1 до 255 символов"
}

enum ValidationHelper {
	static func validate(field: String, with regex: String) -> Bool {
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: field)
	}
	
	static func validateName(name: String) -> String? {
		return validate(field: name, with: RegularExpression.lengthCheck.regex) &&
		validate(field: name, with: RegularExpression.noSpecialCharsAndNumbers.regex) &&
		validate(field: name, with: RegularExpression.latinOrCyrillic.regex)
		? nil
		: ConstantsString.nameLength
	}
	
	static func validateSurname(surname: String) -> String? {
		return validate(field: surname, with: RegularExpression.lengthCheck.regex) &&
		validate(field: surname, with: RegularExpression.noSpecialCharsAndNumbers.regex) &&
		validate(field: surname, with: RegularExpression.latinOrCyrillic.regex)
		? nil
		: ConstantsString.nameLength
	}
	
	static func validateTelephone(telephone: String) -> String? {
		let cleanTelephone = telephone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
		if cleanTelephone.count == 11 && validate(field: cleanTelephone, with: RegularExpression.phoneRegex.regex) {
			return nil
		}
		return ConstantsString.phoneNumberInvalid
	}
	
	static func validateMail(mail: String) -> String? {
		if mail.count > 255 {
			return ConstantsString.invalidEmail
		}
		return validate(field: mail, with: RegularExpression.emailRegex.regex)
		? nil
		: ConstantsString.invalidEmail
	}
	
	static func validateBio(bio: String) -> String? {
		return bio.count >= 1 && bio.count <= 255
		? nil
		: ConstantsString.bioLength
	}
	
	@MainActor
	static func formatInputWithMask(_ input: String) -> String {
		let cleanNumber = input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
		let prefix = "+7"
		var numberWithoutPrefix = cleanNumber
		
		if cleanNumber.isEmpty {
			return ""
		}
		
		if numberWithoutPrefix.hasPrefix("8") {
			numberWithoutPrefix.removeFirst()
		} else if numberWithoutPrefix.hasPrefix("7") {
			numberWithoutPrefix.removeFirst()
		}
		if numberWithoutPrefix.isEmpty {
			return prefix
		}
		
		let mask = "(XXX) XXX-XX-XX"
		var result = prefix
		var startIndex = numberWithoutPrefix.startIndex
		let endIndex = numberWithoutPrefix.endIndex
		
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
	
	@MainActor
	static func filterInput(_ input: String) -> String {
		let englishLetterSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz- ")
		let russianLetterSet = CharacterSet(charactersIn: "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя- ")
		
		guard let firstCharacter = input.first, firstCharacter != "-" && firstCharacter != " " else {
			return ""
		}
		
		guard let firstScalar = firstCharacter.unicodeScalars.first else {
			return input
		}
		let isFirstCharacterRussian = russianLetterSet.contains(firstScalar)
		let isFirstCharacterEnglish = englishLetterSet.contains(firstScalar)
		
		var filteredInput = ""
		
		for character in input {
			if let scalar = character.unicodeScalars.first {
				if isFirstCharacterRussian && russianLetterSet.contains(scalar) {
					filteredInput.append(character)
				} else if isFirstCharacterEnglish && englishLetterSet.contains(scalar) {
					filteredInput.append(character)
				}
			}
		}
		
		filteredInput = filteredInput.replacingOccurrences(of: " {3,}", with: "  ", options: .regularExpression)
		
		let words = filteredInput.split { $0 == " " || $0 == "-" || $0.isNewline }
		
		if words.count > 2 {
			let truncatedInput = words.prefix(2).joined(separator: " ")
			return truncatedInput
		}
		return filteredInput
	}
}

enum RegularExpression: String {
	case lengthCheck = "^.{1,64}$"
	case noSpecialCharsAndNumbers = "^[^\\d\\W_]+$"
	case latinOrCyrillic = "^([a-zA-Z]+|[а-яА-Я]+)$"
	case phoneRegex = "^[0-9]{11}$"
	case emailRegex = "^(?!.*\\.{2})(?!.*--)(?!-)([A-Z0-9a-z._%#$&'*+=?^`{|}~/'-]+)(?<!\\.)@([A-Za-z0-9]+(?:[-][A-Za-z0-9]+)*(?:\\.[A-Za-z0-9]+(?:[-][A-Za-z0-9]+)*)+)(?<!\\.)$"
	
	var regex: String {
		return rawValue
	}
}
