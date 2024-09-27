import SwiftUI

struct ConsentRow: View {
    @Binding var isChecked: Bool
    @State private var showWebView = false
    let text: String
    let subtitle: String?
    let link: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .bold))
                Spacer()
                
                Button(action: {
                    isChecked.toggle()
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                        if isChecked {
                            Circle()
                                .fill(Color.black)
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 44, height: 44)
                }
            }
            .padding(.vertical, 5)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .foregroundColor(.gray)
                    .font(.system(size: 10, weight: .regular))
            }
            if let link = link {
                Button(action: {
                    showWebView.toggle()
                }) {
                    HStack {
                        Text("Подробнее")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.blue)
                        Image(systemName:"link")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.blue)
                    }
                }
                .sheet(isPresented: $showWebView) {
                    WebView(url: URL(string: link))
                }
            }
        }
    }
}

#Preview {
    struct ConsentRowPreview: View {
        @State private var isChecked: Bool = false
        
        var body: some View {
            VStack {
                ConsentRow(isChecked: $isChecked, text: "Согласен на обработку персональных данных", subtitle: nil, link: "https://silavetra.com/legal/personal-data")
                ConsentRow(isChecked: $isChecked, text: "Согласен с правилами участия", subtitle: "Занятия на яхтах — безопасные, но достаточно активные.\nПоэтому в целях вашей же безопасности мы не допускаем до тренировок и прогулок беременных и людей с серьезными\nтравмами. Также мы не допускаем до тренировок участников в состоянии даже легкого алкогольного опьянения.", link: "https://silavetra.com/legal/personal-data")
                ConsentRow(isChecked: $isChecked, text: "Согласен с условиями возврата", subtitle: "Вы можете отменить занятие, если до него осталось больше\n72 часов, а перенести — за 48 часов и более.", link: "https://silavetra.com/legal/personal-data")
            }
            .padding()
        }
    }
    
    return ConsentRowPreview()
}
