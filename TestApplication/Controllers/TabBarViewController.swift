//
//  TabBarViewController.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcHome = HomeViewController()
        let vcShared = SharedViewController()
        let vcViewed = ViewedViewController()
        let vcSelected = SelectedViewController()
        
        vcHome.title = "Home"
        vcShared.title = "Most Shared"
        vcViewed.title = "Most Viewed"
        vcSelected.title = "Selected"
        
        vcHome.navigationItem.largeTitleDisplayMode = .always
        vcShared.navigationItem.largeTitleDisplayMode = .always
        vcViewed.navigationItem.largeTitleDisplayMode = .always
        vcSelected.navigationItem.largeTitleDisplayMode = .always
        
        let navHome = UINavigationController(rootViewController: vcHome)
        let navShared = UINavigationController(rootViewController: vcShared)
        let navViewed = UINavigationController(rootViewController: vcViewed)
        let navSelected = UINavigationController(rootViewController: vcSelected)
        
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navShared.tabBarItem = UITabBarItem(title: "Most Shared", image: UIImage(systemName: "paperplane"), tag: 2)
        navViewed.tabBarItem = UITabBarItem(title: "Most Viewed", image: UIImage(systemName: "trophy"), tag: 3)
        navSelected.tabBarItem = UITabBarItem(title: "Selected", image: UIImage(systemName: "bookmark"), tag: 4)
        
        navHome.navigationBar.prefersLargeTitles = true
        navShared.navigationBar.prefersLargeTitles = true
        navViewed.navigationBar.prefersLargeTitles = true
        navSelected.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navHome, navShared, navViewed, navSelected], animated: false)
    }
}
