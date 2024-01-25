//   Created on 2024/01/24
//   Using Swift 5.0
//   AuthenticationView.swift
//   Created by Owen
  

import SwiftUI

import Cassette

struct AuthenticationView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = AuthenticationViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .white], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack(spacing: 16) {
                Spacer()
                Image("tron")
                    .resizable()
                    .scaledToFit()
                Spacer()
                BtnCassette(buttonMode: .normal(text: "Create"))
                    .setBackgroundColor(color: .red.opacity(0.7))
                    .setTitleTextColor(color: .white)
                    .setBorderColor(color: .clear)
                    .click {
                        Util.pushVC(navigation: navigation, CreateAccountView(navigation: navigation))
                    }
                
                BtnCassette(buttonMode: .normal(text: "Import"))
                    .setBorderColor(color: .red.opacity(0.7))
                    .click {
                        Util.pushVC(navigation: navigation, ImportAccountView(navigation: navigation))
                    }
            }
            .padding(.horizontal, 16)
        }
        .onAppear(perform: {
            viewModel.setUpTron()
        })
    }
}

#Preview {
    AuthenticationView()
}
