//   Created on 2024/01/24
//   Using Swift 5.0
//   CreateAccountViewModel.swift
//   Created by Owen
  

import Foundation

import TronWeb3

final class CreateAccountViewModel: ObservableObject {
    let privateKey = ""
    let TRONApiKey = ""
    var chainType: ChainType = .nile
    
    @Published var text: String = ""
    @Published var addressText: String = ""
    
    @Published var createButtonDisable: Bool = true
    
    @Published var isLoading: Bool = false
    
    func createAccount(completion: @escaping (Bool) -> ()) {
        isLoading = true
        
        Tron.shared.createAccount {[weak self] result, data in
            if result {
                print("Create 성공")
                completion(true)
            } else {
                print("Create 실패")
                completion(false)
            }
            
            self?.text = data
            
            self?.isLoading = false
        }
    }
}
