//   Created on 2024/01/25
//   Using Swift 5.0
//   InputPasswordViewModel.swift
//   Created by Owen
  

import Foundation

final class InputPasswordViewModel: ObservableObject {
    @Published var passwordText: String = "" { didSet { checkButtonDisable() } }
    @Published var checkPasswordText: String = "" { didSet { checkButtonDisable() } }
    @Published var buttonDisable: Bool = true
    
    func checkButtonDisable() {
        buttonDisable = passwordText.isEmpty || checkPasswordText.isEmpty || passwordText != checkPasswordText
    }
}
