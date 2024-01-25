//   Created on 2024/01/25
//   Using Swift 5.0
//   InputPasswordView.swift
//   Created by Owen
  

import SwiftUI

import Cassette

struct InputPasswordView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = InputPasswordViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                TextFieldCassette(mode: .secureUnderLine(placeHolder: "Input Password", text: $viewModel.passwordText, secureImageType: .system(color: .black, on: "", off: ""), title: "Password", alignment: .leading))
                
                TextFieldCassette(mode: .secureUnderLine(placeHolder: "Input Same Password", text: $viewModel.checkPasswordText, secureImageType: .system(color: .black, on: "", off: ""), title: "Check Password", alignment: .leading))
                
                Spacer()
                
                BtnCassette(buttonMode: .normal(text: "다음"))
                    .setDisable(disable: $viewModel.buttonDisable)
                    .click {
                        Constants.password = viewModel.passwordText
//                        Util.pushVC(navigation: navigation, <#T##view: View##View#>)
                    }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    InputPasswordView()
}
