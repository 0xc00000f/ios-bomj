//
//  TabBarController.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 18.04.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().barTintColor = .systemBlue
        UITabBar.appearance().backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)

        setupControls()
        // Do any additional setup after loading the view.
    }

    private func setupControls() {

        let newsVC = NewsViewController()
        newsVC.tabBarItem.title = "Новости"
        newsVC.tabBarItem.image = UIImage(systemName: "list.bullet")

        let findVC = FindViewController()
        findVC.tabBarItem.title = "Поиск"
        findVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")


        let helpCollectionViewLayout = UICollectionViewFlowLayout()
        let helpVC = HelpViewController(collectionViewLayout: helpCollectionViewLayout)
        helpVC.tabBarItem.title = "Помочь"
        helpVC.tabBarItem.image = UIImage(systemName: "heart.circle.fill")
        
        let helpNavigationController = UINavigationController(rootViewController: helpVC)


        let historyVC = HistoryViewController()
        historyVC.tabBarItem.title = "История"
        historyVC.tabBarItem.image = UIImage(systemName: "clock.arrow.circlepath")


        let profileVC = ProfileViewController()
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        viewControllers = [newsVC, findVC, helpNavigationController, historyVC, profileVC]

    }

}
