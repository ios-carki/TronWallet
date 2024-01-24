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
                if setupResult {
                //......
                    completion(true)
                    print("asdf")
                } else {
                    completion(false)
                }
            }
        } else {
                //......

            completion(false)
        }
    }
}
