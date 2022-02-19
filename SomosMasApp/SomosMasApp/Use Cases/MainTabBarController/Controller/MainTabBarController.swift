//
//  MainTabBarController.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 17/02/2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    private func setupTabBar() {
        tabBar.barStyle = .black
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    private func setupViewControllers() {
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.green
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.red
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        viewControllers = [vc1, vc2]
    }

}
