//
//  User.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import Foundation

struct User: Identifiable, Codable {
	var id = UUID()
	var name: String
	var lastName: String
	var email: String
	var phoneNumber: String
	var password: String
	var bio: String
}
