import SwiftUI

struct DatePickerView: View {
    var title: String
    @Binding var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .bold))
                .padding(.leading, 10)
            
            DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.grayBackground)
                        .frame(width: 180, height: 55)
                )
                .frame(width: 180)
                .accentColor(.black)
        }
    }
}

#Preview {
    DatePickerView(title: "", date: .constant(Date()))
}
