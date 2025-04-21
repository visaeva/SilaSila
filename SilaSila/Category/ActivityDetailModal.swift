//
//  ActivityDetailModal.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import SwiftUI

struct ActivityDetailModal: View {
	let activity: Activities
	
	var body: some View {
		ScrollView {
			VStack(spacing: 16) {
				Image(activity.imageName)
					.resizable()
					.scaledToFit()
					.frame(height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 12))
					.padding(.horizontal)
				
				Text(activity.name)
					.font(.title2)
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
					.padding(.horizontal)
				
				Text(activity.description)
					.font(.body)
					.foregroundColor(.secondary)
					.multilineTextAlignment(.center)
					.padding(.horizontal)
				
				Spacer()
				
				Button(action: {
				}) {
					Text("Узнать больше")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(maxWidth: .infinity)
						.background(Color.blue)
						.cornerRadius(10)
						.padding(.horizontal)
				}
				.padding(.bottom)
			}
			.padding(.top)
		}
		.background(Color(.systemBackground))
		.presentationDetents([.medium])
		.presentationDragIndicator(.visible)
	}
}

#Preview {
	ActivityDetailModal(activity: Activities(id: UUID(), name: "Глэмпинг", imageName: "glamping", favourite: false, description: "Отдохните в стильных домиках из морских контейнеров с пейзажами на берегу Пироговского водохранилища всего в получасе езды от столицы"))
}
