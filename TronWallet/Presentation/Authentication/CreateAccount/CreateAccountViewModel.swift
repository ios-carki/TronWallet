//   Created on 2024/01/24
//   Using Swift 5.0
//   CreateAccountViewModel.swift
//   Created by Owen
  

import Foundation

import TronWeb3

final class CreateAccountViewModel: ObservableObject {

    let tronWeb = TronWeb3()
    let privateKey = ""
    let TRONApiKey = ""
    var chainType: ChainType = .nile
    
    @Published var text: String = ""
    @Published var mNemonicKey: String = ""
    @Published var addressText: String = ""
    
    func createAccount() {
        Tron.shared.setTron { result in
            if result {
                self.tronWeb.createAccount { state, base58Address, hexAddress, privateKey, publicKey, error in
                    if state {
                        let text =
                            "base58Address: " + base58Address + "\n\n" +
                            "hexAddress: " + hexAddress + "\n\n" +
                            "privateKey: " + privateKey + "\n\n" +
                            "publicKey: " + publicKey
                        self.text = text
                        self.addressText = hexAddress
                    } else {
                        self.text = error
                    }
                }
            } else {
                print("Create Error")
            }
        }
        
    }
    
    func importAccount() {
        Tron.shared.setTron { result in
            if result {
                self.tronWeb.importAccountFromMnemonic (mnemonic: self.mNemonicKey){ state, address, privateKey, publicKey, error in
                    if state {
                        let text =
                            "address: " + address + "\n\n" +
                            "privateKey: " + privateKey + "\n\n" +
                            "publicKey: " + publicKey
                        self.text = text
                        self.addressText = address
                    } else {
                        self.text = error
                    }
                }
            } else {
                print("Import Error")
            }
        }
        
    }
}
