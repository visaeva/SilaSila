import SwiftUI

struct BookingView: View {
	@StateObject private var viewModel = BookingViewModel()
	@StateObject private var participantsViewModel = ParticipantsViewModel()
	@StateObject private var confirmationViewModel = ConfirmationViewModel()
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	var body: some View {
		NavigationStack {
			VStack(alignment: .leading) {
				header
				HStack {
					Button(action: {
						viewModel.selection = 0
					}) {
						firstTab
					}
					Button(action: {
						if viewModel.isFormValid {
							viewModel.selection = 1
						}}) {
							secondTab
						}
					
					Button(action: {
						if viewModel.isFormValid && !viewModel.participants.isEmpty {
							viewModel.selection = 2
						}}) {
							thirdTab
						}
				}
				.padding(.horizontal)
				.padding(.bottom, -5)
				
				if viewModel.selection == 0 {
					DateSelectionView(
						numberOfPeople: $viewModel.numberOfPeople,
						selectedBase: $viewModel.selectedBase,
						selectedBoat: $viewModel.selectedBoat,
						selectedDate: $viewModel.selectedDate,
						selectedDateString: $viewModel.selectedDateString,
						selectedTime: $viewModel.selectedTime,
						onNext: {
							viewModel.selection = 1
						},
						bases: viewModel.bases,
						boats: viewModel.boats,
						dates: viewModel.dates,
						times: viewModel.times
					)
				} else if viewModel.selection == 1 {
					ParticipantsView(
						viewModel: participantsViewModel,
						onNext: {
							viewModel.selection = 2
						},
						participants: $viewModel.participants
					)
				} else if viewModel.selection == 2 {
					ConfirmationView(
						viewModel: confirmationViewModel,
						participants: $viewModel.participants,
						selectedBase: $viewModel.selectedBase,
						selectedBoat: $viewModel.selectedBoat,
						selectedDate: $viewModel.selectedDate,
						selectedTime: $viewModel.selectedTime
					)
				}
			}
			.padding(.top, -15)
			.animation(.easeInOut(duration: 0.3), value: viewModel.selection)
			Spacer()
		}
		.toolbar {
			ToolbarItem(placement:.navigationBarLeading) {
				Button(action: {
					presentationMode.wrappedValue.dismiss()
				}) {
					Image(systemName: "chevron.left")
						.foregroundStyle(.black)
				}
			}
		}
		.navigationBarBackButtonHidden(true)
	}
	
	private var header: some View {
		HStack(spacing: 4) {
			Text("Сила")
				.foregroundStyle(.black)
				.font(.system(size: 17, weight: .bold))
			Image(systemName: "chevron.right")
				.foregroundStyle(.black)
				.font(.system(size: 17, weight: .bold))
			Image(systemName: "chevron.right")
				.foregroundStyle(.black)
				.font(.system(size: 17, weight: .bold))
			Image(systemName: "chevron.right")
				.foregroundStyle(.black)
				.font(.system(size: 17, weight: .bold))
			Text("Ветра")
				.foregroundStyle(.black)
				.font(.system(size: 17, weight: .bold))
			Text("Бронирование")
				.foregroundStyle(.black)
				.font(.system(size: 17, weight: .regular))
				.padding(.horizontal, 12)
				.padding(.vertical, 8)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(Color.black, lineWidth: 1)
				)
				.padding()
			Image(systemName: "person")
				.foregroundStyle(.black)
		}
		.padding()
	}
	
	private var firstTab: some View {
		HStack {
			Circle()
				.stroke(viewModel.selection == 0 ? Color.black : Color.gray, lineWidth: 1)
				.background(Circle().fill(Color.white))
				.overlay(
					Text("1")
						.foregroundColor(viewModel.selection == 0 ? .black : .gray)
				)
				.frame(width: 30, height: 30)
			
			Text("ВЫБОР ДАТ")
				.foregroundColor(viewModel.selection == 0 ? .black : .gray)
				.font(.system(size: 12, weight: .regular))
				.lineLimit(1)
		}
	}
	
	private var secondTab: some View {
		HStack {
			Circle()
				.stroke(viewModel.selection == 1 ? Color.black : Color.gray, lineWidth: 1)
				.background(Circle().fill(Color.white))
				.overlay(
					Text("2")
						.foregroundColor(viewModel.selection == 1 ? .black : .gray)
				)
				.frame(width: 30, height: 30)
			
			Text("УЧАСТНИКИ")
				.foregroundColor(viewModel.selection == 1 ? .black : .gray)
				.font(.system(size: 12, weight: .regular))
				.lineLimit(1)
		}
	}
	
	private var thirdTab: some View {
		HStack {
			Circle()
				.stroke(viewModel.selection == 2 ? Color.black : Color.gray, lineWidth: 1)
				.background(Circle().fill(Color.white))
				.overlay(
					Text("3")
						.foregroundColor(viewModel.selection == 2 ? .black : .gray)
				)
				.frame(width: 30, height: 30)
			
			Text("ПОДТВЕРЖДЕНИЕ")
				.foregroundColor(.gray)
				.font(.system(size: 12, weight: .regular))
				.lineLimit(1)
		}
	}
}

#Preview {
	BookingView()
}
