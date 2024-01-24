//   Created on 2024/01/24
//   Using Swift 5.0
//   Util.swift
//   Created by Owen
  

import Foundation
import SwiftUI

final class Util {
    static func pushVC<ContentView: View>(navigation: CustomNavigationController?, _ view: ContentView) {
        guard let navigation = navigation else { return }
        
        let hostingController = UIHostingController(rootView: view)
        navigation.pushViewController(hostingController, animated: true)
    }

}
