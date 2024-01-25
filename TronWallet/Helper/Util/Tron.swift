//   Created on 2024/01/24
//   Using Swift 5.0
//   Tron.swift
//   Created by Owen
  

import Foundation

import TronWeb3

final class Tron {
    static let shared = Tron()
    let tronWeb = TronWeb3()
    var chainType: ChainType = .nile
    let privateKey = ""
    
    private init() {}
    
    func setTron(completion: @escaping (Bool) -> ()) {
        if tronWeb.isGenerateTronWebInstanceSuccess != true {
            tronWeb.setup(privateKey: privateKey, node: chainType == .main ? TRONMainNet : TRONNileNet) { [weak self] setupResult in
                guard let self = self else { return }
                print("setupResult: \(setupResult)")
                completion(setupResult)
            }
        } else {
            print("nope")
            completion(false)
        }
    }
    
    func createAccount(completion: @escaping (Bool, String) -> ()) {
        self.setTron { result in
            self.tronWeb.createAccount { state, base58Address, hexAddress, privateKey, publicKey, error in
                if state {
                    let text =
                        "base58Address: " + base58Address + "\n\n" +
                        "hexAddress: " + hexAddress + "\n\n" +
                        "privateKey: " + privateKey + "\n\n" +
                        "publicKey: " + publicKey
                    completion(true, hexAddress)
                } else {
                    completion(false, error)
                }
            }
        }
    }
    
    //completion(state, address)
    func importAccount(mnemonicKey: String, completion: @escaping (Bool, String) -> ()) {
        self.setTron { result in
            self.tronWeb.importAccountFromMnemonic(mnemonic: mnemonicKey) { state, address, privateKey, publicKey, error in
                if state {
                    let text =
                        "address: " + address + "\n\n" +
                        "privateKey: " + privateKey + "\n\n" +
                        "publicKey: " + publicKey
                    print("임포트 성공")
                    print("Data: ", text)

                    Constants.address = address
                    Constants.mnemonicKey = mnemonicKey

                    completion(true, address)
                } else {
                    completion(false, error)
                }
            }
        }
    }
    
    func getBalance(address: String, completion: @escaping (Bool, String) -> ()) {
        self.setTron { result in
            self.tronWeb.getRTXBalance(address: address) { state, balance, error in
                print("Balance: ", balance)
                if state {
                    completion(true, balance)
                    
                } else {
                    completion(true, error)
                    
                }
            }
        }
    }
    
    func sendTRX(remark: String, toAddress: String, amountText: String, completion: @escaping (Bool, String) -> ()) {
        self.setTron { result in
            self.tronWeb.trxTransferWithRemark(remark: remark, toAddress: toAddress, amount: amountText) { state, txID, error in
                print("Send State: ", state)
                if state {
                    completion(true, txID)
                } else {
                    completion(true, error)
                }
            }
        }
    }
    
    /*
     let remark = ""
     let toAddress = ""
     let amountText = "1" // This value is 0.000001
     tronWeb.trxTransferWithRemark(remark: remark,
                                           toAddress: toAddress,
                                           amount: amountText){ [weak self] (state, txid,error) in
         guard let self = self else { return }
         print("state = \(state)")
         print("txid = \(txid)")
         if (state) {
             self.hashLabel.text = txid
         } else {
             self.hashLabel.text = error
         }
     }
     */
}
