//
//  AppDelegate.swift
//  ios-bomj
//
//  Created by Maxim Tsyganov on 17.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let tabBarController = TabBarController()
        window?.rootViewController = tabBarController
        
        return true
    }

}

