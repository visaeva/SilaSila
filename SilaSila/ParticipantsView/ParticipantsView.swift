import SwiftUI

struct ParticipantsView: View {
    @StateObject private var viewModel = ParticipantsViewModel()
    var onNext: () -> Void
    @Binding var participants: [Participant]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Участники")
                        .font(.largeTitle)
                        .padding()
                    
                    ForEach(0..<viewModel.participants.count, id: \.self) { index in
                        if index == 0 || viewModel.showAdditionalParticipants {
                            VStack(alignment: .leading) {
                                Text("Участник #\(index + 1)")
                                    .font(.title)
                                    .padding(.top, index == 0 ? -10 : 20)
                                    .padding()
                                ParticipantStructView(
                                    name: $viewModel.participants[index].name,
                                    lastName: $viewModel.participants[index].lastName,
                                    phoneNumber: $viewModel.participants[index].phoneNumber,
                                    email: $viewModel.participants[index].email,
                                    selectedExperience: $viewModel.participants[index].selectedExperience,
                                    selectedDate: $viewModel.participants[index].selectedDate,
                                    experiences: viewModel.experiences
                                )
                            }
                        }
                    }
                    
                    HStack {
                        Text("Заполнить остальных участников")
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                        Toggle("", isOn: $viewModel.showAdditionalParticipants)
                            .labelsHidden()
                    }
                    .padding()
                    HStack {
                        Text("Подтверждаю, что всем участникам больше 14 лет")
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                        Toggle("", isOn: $viewModel.confirmation)
                            .labelsHidden()
                    }
                    .padding()
                    
                    if viewModel.confirmation {
                        Button(action: {
                            participants = viewModel.participants
                            onNext()
                        }) {
                            Text("Далее")
                                .font(.headline)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    }
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    ParticipantsView(onNext: {}, participants: .constant([]))
}
