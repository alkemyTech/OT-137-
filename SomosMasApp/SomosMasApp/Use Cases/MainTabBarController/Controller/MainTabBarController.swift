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
        
        let homeViewController = HomeViewController(nibName :"HomeViewController",bundle : nil)
        homeViewController.title = "Home"
        let navControllerHomeView = UINavigationController(rootViewController: homeViewController)
        navControllerHomeView.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.red
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        viewControllers = [navControllerHomeView, vc2]
    }

}
