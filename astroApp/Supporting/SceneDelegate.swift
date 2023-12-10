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
//        let planetsIcon = UITabBarItem(title: "Planets", image: UIImage(named: "planetstab"), tag: 1)
//        vc.tabBarItem = planetsIcon
        
        let zodiacVC = ZodiacsViewController()
        let zodiacNav = UINavigationController(rootViewController: zodiacVC)
//        let zodiacsIcon = UITabBarItem(title: "Zodiacs", image: UIImage(named: "zodiacstab"), tag: 2)
//        zodiacVC.tabBarItem = zodiacsIcon
        
        let tab = UITabBarController()
        tab.viewControllers = [nav, zodiacNav]
        window.rootViewController = tab
        self.window = window
        self.window?.makeKeyAndVisible()
    }


}

