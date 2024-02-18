//
//  SceneDelegate.swift
//  astroApp
//
//  Created by Jameka Echols on 9/3/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let customFont = UIFont(name: "Nexa Demo", size: 10) ?? UIFont.systemFont(ofSize: 10)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: UIColor.purple], for: .normal)

        let tabBarViewModel = TabBarViewModel()
        let tabBarController = CustomTabBarController()

        tabBarController.viewControllers = tabBarViewModel.tabs.map { tab in
            let navigationController = UINavigationController(rootViewController: tab.viewController!)
            navigationController.tabBarItem = UITabBarItem(title: tab.title, image: tab.icon, selectedImage: tab.selectedIcon)
            return navigationController
        }
        
        window.rootViewController = tabBarController
        self.window = window
        self.window?.makeKeyAndVisible()
    }


}

