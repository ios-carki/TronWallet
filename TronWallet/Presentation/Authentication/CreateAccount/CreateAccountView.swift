//   Created on 2024/01/24
//   Using Swift 5.0
//   CreateAccountView.swift
//   Created by Owen
  

import SwiftUI

struct CreateAccountView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = CreateAccountViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack {
                ScrollView {
                    VStack(spacing: 24) {
                        
                        Divider()
                        
                        TextField("Input MnemonicKey", text: $viewModel.mNemonicKey)
                        
                        Button(action: {
                            viewModel.importAccount()
                        }, label: {
                            Text("계정 가져오기")
                        })
                        
                        Divider()
                        
                        Text(viewModel.text)
                        
                        Button(action: {
                            viewModel.createAccount()
                        }, label: {
                            Text("계정 생성")
                        })
                    }
                }
                
                Spacer()
                
                
                
                NavigationLink {
                    SendView(address: viewModel.addressText)
                } label: {
                    Text("Send")
                }

            }
        })
        .padding()
    }
}

#Preview {
    CreateAccountView()
}
