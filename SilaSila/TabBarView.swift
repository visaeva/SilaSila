import SwiftUI

struct TabBarView: View {
    @State private var storiesCellView: StoriesCellView = StoriesCellView()
    @State private var mainScreen: MainScreen = MainScreen()
    @StateObject private var profileViewModel = ProfileViewModel()
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
               // .background(Color.black)
                
                .tabItem {
                    Label("Главная", systemImage: "arrow.up.message.fill")
                }
                
                ProfileTabView(viewModel: profileViewModel)
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                    }
                
            }
           
            .tint(.black)
            
        }
    }
}



#Preview {
    TabBarView()
}

