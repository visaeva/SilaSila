import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var viewModel: ConfirmationViewModel
    @Binding var participants: [Participant]
    @State private var isCheckedPersonal: Bool = false
    @State private var isCheckedOther: Bool = false
    @State private var isCheckedThird: Bool = false
    
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
                    
                    let validParticipants = participants.filter { !$0.name.isEmpty && !$0.lastName.isEmpty && !$0.email.isEmpty }
                    
                    ForEach(Array(validParticipants.enumerated()), id: \.element.id) { index, participant in
                        VStack(alignment: .leading) {
                            Text("Электронная почта")
                                .font(.system(size: 17, weight: .bold))
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
                                
                                Text(participant.selectedDate, style: .date)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                        }
                        .padding()
                        Divider()
                        
                        if index == 0 {
                            PickerSection(title: "Выберите способ оплаты", selection: $viewModel.selectedPay, items: viewModel.payments)
                                .padding([.leading, .trailing], 20)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Промокод")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 17, weight: .bold))
                                    
                                    TextField("Введите промокод", text: $viewModel.promoCode)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular))
                                }
                            }
                            .padding()
                        }
                    }
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Комментарий")
                                .foregroundColor(.gray)
                                .font(.system(size: 17, weight: .bold))
                            
                            TextEditor(text: $viewModel.comment)
                                .padding(4)
                                .frame(height: 70)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                        }
                    }
                    .padding()
                    Divider()
                    
                    VStack {
                        ConsentRow(isChecked: $isCheckedPersonal, text: "Согласен на обработку персональных данных", subtitle: nil, link: "https://silavetra.com/legal/personal-data")
                        ConsentRow(isChecked: $isCheckedOther, text: "Согласен с публичной офертой", subtitle:"Занятия на яхтах — безопасные, но достаточно активные.\nПоэтому в целях вашей же безопасности мы не допускаем до тренировок и прогулок беременных и людей с серьезными\nтравмами. Также мы не допускаем до тренировок участников в состоянии даже легкого алкогольного опьянения.", link: "https://silavetra.com/legal/strogino")
                        ConsentRow(isChecked: $isCheckedThird, text: "Согласен с условиями отмены и переноса тренировок", subtitle: "Вы можете отменить занятие, если до него осталось больше\n72 часов, а перенести — за 48 часов и более.", link: "https://silavetra.com/legal/strogino#10")
                    }
                    .padding()
                }
                Button(action: {
                    // Переход на страницу оплаты
                    print("Оплатить нажата")
                }) {
                    Text("Оплатить")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    let viewModel = ConfirmationViewModel()
    let participants = [
        Participant(name: "Иван", lastName: "Иванов", phoneNumber: "+7 999 999 9999", email: "ivan@example.com", selectedExperience: "Нет опыта", selectedDate: Date())
    ]
    return ConfirmationView(viewModel: viewModel, participants: .constant(participants))
}
