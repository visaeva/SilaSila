//
//  WelcomeScreen.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 23.05.2024.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black
                .ignoresSafeArea()
            
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
            VStack {
                Spacer()
                Image("boat")
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
