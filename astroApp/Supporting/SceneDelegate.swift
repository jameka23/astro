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
        
        let vc = PlanetsViewController()
        let nav = UINavigationController(rootViewController: vc)
        let planetsIcon = UITabBarItem(title: "Planets", image: UIImage(named: "aspectstab"), tag: 1)
        
        let tabItem = UITabBarItem()
        tabItem.image = UIImage(named: "planets")
        
        
        vc.tabBarItem = planetsIcon
        
        let zodiacVC = ZodiacsViewController()
        let zodiacNav = UINavigationController(rootViewController: zodiacVC)

        
        let tab = CustomTabBarController()
        tab.viewControllers = [nav, zodiacNav]
        window.rootViewController = tab
        self.window = window
        self.window?.makeKeyAndVisible()
    }


}

