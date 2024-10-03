import SwiftUI

struct ParticipantStructView: View {
    @Binding var name: String
    @Binding var lastName: String
    @Binding var phoneNumber: String
    @Binding var email: String
    @Binding var selectedExperience: String
    @Binding var selectedDate: Date
    let experiences: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextFieldView(title: "Имя", text: $name)
                Spacer()
                TextFieldView(title: "Фамилия", text: $lastName)
            }
            .padding()
            
            HStack {
                TextFieldView(title: "Телефон", text: $phoneNumber)
                    .onChange(of: phoneNumber) {
                        if !phoneNumber.isEmpty {
                            phoneNumber = phoneNumber.formatPhoneNumber()
                        }
                    }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Яхтенный опыт")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .bold))
                        .padding(.leading, 10)
                    
                    Picker("Выберите уровень", selection: $selectedExperience) {
                        ForEach(experiences, id: \.self) { experience in
                            Text(experience).tag(experience)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.grayBackground)
                    )
                    .frame(width: 180)
                    .accentColor(.black)
                }
            }
            .padding()
            
            HStack {
                TextFieldView(title: "Электронная почта", text: $email)
                Spacer()
                DatePickerView(title: "Дата рождения", date: $selectedDate)
            }
            .padding()
        }
    }
}

#Preview {
    ParticipantStructView(name: .constant("Иван"), lastName: .constant("Иванов"), phoneNumber: .constant("8-999-999-99-99"), email: .constant("ivanovivan@gmail.com"), selectedExperience: .constant("Нет опыта"), selectedDate: .constant(Date()), experiences: ["Нет опыта"])
}

