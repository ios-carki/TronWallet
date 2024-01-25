//   Created on 2024/01/24
//   Using Swift 5.0
//   CreateAccountView.swift
//   Created by Owen
  

import SwiftUI

import Cassette

struct CreateAccountView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = CreateAccountViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                BtnCassette(buttonMode: .normal(text: "계정 생성"))
                    .click {
                        viewModel.createAccount { result in
                            if result {
                                UIApplication.shared.createTabBar2(index: 0)
                            } else {
                                //실패 팝업
                            }
                        }
                    }
                
                Text(viewModel.text)
                
                Spacer()
                
                BtnCassette(buttonMode: .normal(text: "시작하기"))
                    .setBorderColor(color: .clear)
                    .setBackgroundColor(color: .black)
                    .setTitleTextColor(color: .white)
                    .setDisableTitleTextColor(color: .black.opacity(0.4))
                    .setDisable(disable: $viewModel.createButtonDisable)
                    .click {
                        UIApplication.shared.createTabBar2(index: 0)
                    }
            }
            .padding()
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
