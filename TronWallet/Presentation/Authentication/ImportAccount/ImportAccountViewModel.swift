//   Created on 2024/01/24
//   Using Swift 5.0
//   ImportAccountViewModel.swift
//   Created by Owen
  

import Foundation

import TronWeb3

final class ImportAccountViewModel: ObservableObject {
    
    @Published var mNemonicKey: String = ""
    @Published var text: String = ""
    @Published var addressText: String = ""
    
    @Published var createButtonDisable: Bool = true
    
    @Published var isLoading: Bool = false
    
    func importAccount() {
        isLoading = true
        
        Tron.shared.importAccount(mnemonicKey: self.mNemonicKey) { [weak self] result, data in
            if result {
                print("Import 성공")
            } else {
                print("Import 실패")
            }
            
            self?.isLoading = false
        }
    }
//    func importAccount() {
//        Tron.shared.setTron { result in
//            if result {
//                self.tronWeb.importAccountFromMnemonic (mnemonic: self.mNemonicKey){ state, address, privateKey, publicKey, error in
//                    if state {
//                        let text =
//                            "address: " + address + "\n\n" +
//                            "privateKey: " + privateKey + "\n\n" +
//                            "publicKey: " + publicKey
//                        self.text = text
//                        self.addressText = address
//                        
//                        Constants.address = address
//                        Constants.mnemonicKey = self.mNemonicKey
//                        
//                        self.createButtonDisable = false
//                    } else {
//                        self.text = error
//                        
//                        self.createButtonDisable = true
//                    }
//                }
//            } else {
//                print("Import Error")
//            }
//        }
//        
//    }
}
