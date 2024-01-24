//   Created on 2024/01/24
//   Using Swift 5.0
//   SendViewModel.swift
//   Created by Owen
  

import Foundation

import TronWeb3

final class SendViewModel: ObservableObject {
    let tronWeb = TronWeb3()
    
    @Published var balanceText: String = ""
    @Published var toAddress: String = ""
    @Published var amountText: String = ""
    
    func getBalance(address: String) {
        Tron.shared.setTron { result in
            if result {
                self.tronWeb.getRTXBalance(address: address) { state, balance,error in
                    print("Balance: ", balance)
                    if state {
                        self.balanceText = balance + " TRX"
                    } else {
                        self.balanceText = error
                    }
                }
            } else {
                
            }
        }
        
    }
}
