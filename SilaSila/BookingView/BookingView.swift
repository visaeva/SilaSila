import SwiftUI

struct BookingView: View {
    @StateObject private var viewModel = BookingViewModel()
    @StateObject private var participantsViewModel = ParticipantsViewModel()
    @StateObject private var confirmationViewModel = ConfirmationViewModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
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
                HStack {
                    Button(action: {
                        viewModel.selection = 0
                    }) {
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
                    Button(action: {
                        viewModel.selection = 1
                    }) {
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
                    
                    Button(action: {
                        viewModel.selection = 2
                    }) {
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
                    
                    Button(action: {
                        viewModel.selection = 3
                    }) {
                        HStack {
                            Circle()
                                .stroke(viewModel.selection == 3 ? Color.black : Color.gray, lineWidth: 1)
                                .background(Circle().fill(Color.white))
                                .overlay(
                                    Text("4")
                                        .foregroundColor(viewModel.selection == 3 ? .black : .gray)
                                )
                                .frame(width: 30, height: 30)
                            
                            Text("ОПЛАТА")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .lineLimit(1)
                        }
                    }
                    
                    Button(action: {
                        viewModel.selection = 4
                    }) {
                        HStack {
                            Circle()
                                .stroke(viewModel.selection == 4 ? Color.black : Color.gray, lineWidth: 1)
                                .background(Circle().fill(Color.white))
                                .overlay(
                                    Text("5")
                                        .foregroundColor(viewModel.selection == 4 ? .black : .gray)
                                )
                                .frame(width: 30, height: 30)
                            
                            Text("ЗАВЕРШЕНИЕ")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .lineLimit(1)
                        }
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
                    ParticipantsView(viewModel: participantsViewModel,
                                     onNext: {
                        viewModel.selection = 2 },
                                     participants: $viewModel.participants)
                } else if viewModel.selection == 2 {
                    ConfirmationView(viewModel: confirmationViewModel,
                                     participants: $viewModel.participants,
                                     selectedBase: $viewModel.selectedBase,
                                     selectedBoat: $viewModel.selectedBoat,
                                     selectedDate: $viewModel.selectedDate,
                                     selectedTime: $viewModel.selectedTime)
                }
            }
            .padding(.top, 20)
            Spacer()
        }
    }
}

#Preview {
    BookingView()
}
