//
//  TabBarController.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 18.04.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let middleButtonDiameter: CGFloat = 42
    private let greenColor: UIColor = UIColor(red: 102.0 / 255.0, green: 166.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)

    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.layer.cornerRadius = middleButtonDiameter / 2
        middleButton.backgroundColor = greenColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.addTarget(self, action: #selector(didPressedMiddleButton), for: .touchUpInside)
        return middleButton
    }()

    @objc private func didPressedMiddleButton() {
        
    }

    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "heart.fill")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = { () -> CustomTabBar in
                let tabBar = CustomTabBar()
                tabBar.delegate = self
                return tabBar
            }()
        self.setValue(tabBar, forKey: "tabBar")

        UITabBar.appearance().barTintColor = .systemBlue
        UITabBar.appearance().backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)

        setupControls()
        makeUI()
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

    private func makeUI() {

        tabBar.addSubview(middleButton)
        middleButton.addSubview(heartImageView)

        NSLayoutConstraint.activate([

            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: 15),
            heartImageView.widthAnchor.constraint(equalToConstant: 18),
            heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
    }

}
