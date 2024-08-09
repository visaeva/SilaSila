import SwiftUI

struct ConfirmationView: View {
    var participants: [Participant]
    @StateObject private var viewModel = ConfirmationViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Дата и время начала тренировки")
                            .foregroundStyle(.black)
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding()
                    
                    HStack {
                        Text("7 августа, 07:30")
                            .foregroundStyle(.black)
                            .font(.system(size: 17, weight: .bold))
                    }
                    .padding()
                    .padding(.top, -20)
                    
                    HStack {
                        Text("Тренировка под парусами Ultima Яндекс GO")
                            .foregroundStyle(.black)
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding()
                    .padding(.top, -30)
                    
                    HStack {
                        Text("Нужно внести оплату в течении 15 минут")
                            .foregroundStyle(.black)
                            .font(.system(size: 17, weight: .bold))
                    }
                    .padding()
                    ForEach(participants, id: \.id) { participant in
                        VStack(alignment: .leading) {
                            Text("Электронная почта")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundStyle(.gray)
                            
                            Text(participant.email)
                                .font(.system(size: 17, weight: .regular))
                                .foregroundStyle(.black)
                        }
                        .padding()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Имя")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .bold))
                                
                                
                                Text(participant.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Фамилия")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .bold))
                                
                                Text(participant.lastName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                                
                            }
                            .padding(.trailing, 20)
                        }
                        .padding()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Номер телефона")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .bold))
                                
                                
                                Text(participant.phoneNumber)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Яхтенный опыт")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .bold))
                                
                                Text(participant.selectedExperience)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                                
                            }
                            .padding(.trailing, 20)
                            
                        }
                        .padding()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Дата рождения")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .bold))
                                
                                
                                Text("1 января 1990")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                        }
                        .padding()
                        Divider()
                        PickerSection(title: "Выберите способ оплаты", selection: $viewModel.selectedPay, items: viewModel.payments)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Промокод")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .bold))
                                
                                Text("Введите промокод")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ConfirmationView(participants: [
        Participant(name: "Иван", lastName: "Иванов", phoneNumber: "8-999-999-99-99", email: "ivanovivan@gmail.com", selectedExperience: "Нет опыта", selectedDate: Date())
    ])
}
