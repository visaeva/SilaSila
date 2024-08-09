import SwiftUI

struct PickerSection: View {
    var title: String
    @Binding var selection: String
    var items: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.top)
            
            Picker(title, selection: $selection) {
                ForEach(items, id: \.self) { item in
                    Text(item).tag(item)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .accentColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}

#Preview {
    PickerSection(title: "", selection: .constant(""), items: [""])
}
