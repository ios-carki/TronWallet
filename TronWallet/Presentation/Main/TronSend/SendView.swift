//   Created on 2024/01/24
//   Using Swift 5.0
//   SendView.swift
//   Created by Owen
  

import SwiftUI

struct SendView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = SendViewModel()
    var address: String
    
    var body: some View {
        VStack(spacing: 16, content: {
            Text("Balance: \(viewModel.balanceText)")
            
            Divider()
            
            TextField("To Address", text: $viewModel.toAddress)
            
            TextField("Amount", text: $viewModel.amountText)
        })
        .onAppear(perform: {
            viewModel.getBalance(address: address)
        })
    }
}

#Preview {
    SendView(address: "")
}
