import SwiftUI

struct TabBarView: View {
    @State private var storiesCellView: StoriesCellView = StoriesCellView()
    @State private var mainScreen: MainScreen = MainScreen()
    
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    storiesCellView
                        .padding(.leading, 10)
                        .padding(.bottom, 20)
                    mainScreen
                    Spacer()
                }
                .background(Color.black)
                .tabItem {
                    Label("Главная", systemImage: "arrow.up.message.fill")
                }
                
                VStack {
                    Text("Главное")
                    //
                }
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
            }
            .tint(.white)
        }
    }
}



#Preview {
    TabBarView()
}

