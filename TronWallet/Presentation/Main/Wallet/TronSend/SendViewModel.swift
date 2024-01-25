//   Created on 2024/01/24
//   Using Swift 5.0
//   SendViewModel.swift
//   Created by Owen
  

import Foundation

import TronWeb3

final class SendViewModel: ObservableObject {
    @Published var balanceText: String = ""
    @Published var remarkText: String = ""
    @Published var toAddress: String = ""
    @Published var amountText: String = ""
    
    func getBalance(address: String) {
        Tron.shared.getBalance(address: address) { result, data in
            print("Balance: ", data)
            if result {
                self.balanceText = data + " TRX"
            } else {
                self.balanceText = data
            }
        }
    }
    
    func send() {
        Tron.shared.sendTRX(remark: remarkText, toAddress: toAddress, amountText: amountText) { result, data in
            if result {
                print("Send 성공")
                print("Transaction ID: ", data)
            } else {
                print("Send 실패")
                print("실패 이유: ", data)
            }
        }
    }
}
