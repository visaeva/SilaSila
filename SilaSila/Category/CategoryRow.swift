//
//  CategoryRow.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 16.04.2025.
//

import SwiftUI

struct CategoryRow: View {
	var categoryName: String
	@StateObject private var viewModel = ActivitiesViewModel()
	@State private var selectedActivity: Activities? 
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(categoryName)
				.font(.headline)
				.padding(.horizontal, 16)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 16) {
					ForEach(viewModel.activities, id: \.id) { activity in
						ZStack(alignment: .topTrailing) {
							VStack(spacing: 8) {
								Image(activity.imageName)
									.resizable()
									.scaledToFill()
									.frame(width: 150, height: 100)
									.clipShape(RoundedRectangle(cornerRadius: 8))
								
								Text(activity.name)
									.font(.caption)
									.foregroundColor(.primary)
									.multilineTextAlignment(.center)
									.lineLimit(2)
									.frame(width: 150)
							}
							.onTapGesture {
								selectedActivity = activity
							}
							
							Button(action: {
								withAnimation {
									if let index = viewModel.activities.firstIndex(where: { $0.id == activity.id }) {
										viewModel.toggleFavourite(at: index)
									}
								}
							}) {
								Image(systemName: activity.favourite ? "heart.fill" : "heart")
									.foregroundColor(activity.favourite ? .red : .gray)
									.padding(8)
							}
						}
						.padding(.vertical, 8)
					}
				}
				.padding(.horizontal, 16)
			}
		}
		.sheet(item: $selectedActivity) { activity in
			ActivityDetailModal(activity: activity)
		}
	}
}

#Preview {
	CategoryRow(categoryName: "Популярные активности")
}
