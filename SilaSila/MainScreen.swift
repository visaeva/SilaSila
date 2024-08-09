import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing:12) {
                    Text("Тренировки в Москве >>>")
                        .foregroundStyle(.white)
                        .font(.title2)
                    Image("mainImage")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(15)
                    HStack {
                        Spacer()
                        NavigationLink(destination: BookingView()) {
                            Text("Записаться на тренировку")
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(.white)
                                .cornerRadius(10)
                        }
                        .navigationTitle("")
                    }
                }
            }
            .background(.black)
        }
        .tint(.red)
    }
}

#Preview {
    MainScreen()
}
