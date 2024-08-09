
import SwiftUI

struct DateSelectionView: View {
    @Binding var numberOfPeople: Int
    @Binding var selectedBase: String
    @Binding var selectedBoat: String
    @Binding var selectedDate: String
    @Binding var selectedTime: String
    var onNext: () -> Void
    var bases: [String]
    var boats: [String]
    var dates: [String]
    var times: [String]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if numberOfPeople > 1 {
                        numberOfPeople -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                }
                .padding()
                
                Text("\(numberOfPeople) человек")
                    .font(.title)
                Button(action: {
                    numberOfPeople += 1
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                }
                .padding()
            }
            .padding(.bottom, -25)
            PickerSection(title: "Выберите базу", selection: $selectedBase, items: bases)
            PickerSection(title: "Выберите лодку", selection: $selectedBoat, items: boats)
            PickerSection(title: "Выберите дату", selection: $selectedDate, items: dates)
            PickerSection(title: "Выберите время", selection: $selectedTime, items: times)
                .padding(.bottom, 20)
            Button(action: {
                onNext()
            }) {
                Text("ДАЛЕЕ")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    DateSelectionView(
        numberOfPeople: .constant(2),
        selectedBase: .constant("Строгино"),
        selectedBoat: .constant(""),
        selectedDate: .constant(""),
        selectedTime: .constant(""),
        onNext: {},
        bases: ["Строгино", "Детский клуб Силы ветра в Строгино", "Пироговское водохранилище (Березки)"],
        boats: ["SV20 (4 человека)", "Луч (1 человек)", "SV20 дабл-хенд (2 человека)", "SV20 прогулка (2 места)", "SV20 прогулка (4 места)"],
        dates: ["1 августа | Четверг", "2 августа | Пятница","3 августа | Суббота", "4 августа | Воскресенье","5 августа | Понедельник", "6 августа | Вторник"],
        times: ["10:00", "12:00"]
    )
}




