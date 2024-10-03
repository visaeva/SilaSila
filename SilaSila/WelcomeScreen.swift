import SwiftUI

struct WelcomeScreen: View {
    @State private var showTabBarView = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("previewImage")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Text("Сила")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Text("Ветра")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                }
                .padding(.top, 50)
                .padding(.leading, 15)
            }
            VStack {
                Spacer()
                
                Text("Начнем путешествие?")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 40)
                Button(action: {
                    showTabBarView = true
                }) {
                    Text("Старт")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 100, height: 100)
                        .background(Circle().fill(Color.black))
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.5), lineWidth: 10)
                        )
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity)
        }
        .fullScreenCover(isPresented: $showTabBarView) {
            TabBarView()
        }
    }
}

#Preview {
    WelcomeScreen()
}
