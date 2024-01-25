//   Created on 2024/01/24
//   Using Swift 5.0
//   UIApplication+Extension.swift
//   Created by Owen


import UIKit
import SwiftUI

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func createTabBar2(index: Int) {
        let sceneDelegate = connectedScenes.first!.delegate as! SceneDelegate
        let tabBar = CustomTabBarController()
        tabBar.selectedIndex = index
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(tabBar, animated: false)
    }
}
