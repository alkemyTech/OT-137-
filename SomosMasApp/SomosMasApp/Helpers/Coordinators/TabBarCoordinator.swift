//
//  TabBarCoordinator.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 17/02/2022.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    func start() {
        let mainTabBar = MainTabBarController()
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = mainTabBar
        window?.makeKeyAndVisible()
    }
    
    
}
