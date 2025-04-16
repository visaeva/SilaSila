import SwiftUI

struct MainScreen: View {
	
	var body: some View {
		NavigationStack {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing:12) {
					Text("Тренировки в Москве >>>")
						.foregroundStyle(.black)
						.font(.title2)
						.padding()
					Image("mainImage")
						.resizable()
						.scaledToFill()
						.cornerRadius(15)
					HStack {
						Spacer()
						NavigationLink(destination: BookingView()) {
							Text("Записаться на тренировку")
								.foregroundStyle(.white)
								.padding(10)
								.background(.black)
								.cornerRadius(10)
						}
						.navigationTitle("")
					}
					.padding()
					CategoryRow(categoryName: "Популярные активности")
					
				}
			}
		}
	}
}

#Preview {
	MainScreen()
}
