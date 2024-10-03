
import SwiftUI

struct TextFieldView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .bold))
                .padding(.leading, 10)
            
            TextField(placeholder, text: $text)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .regular))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.grayBackground)
                )
                .frame(width: 180)
        }
    }
}
