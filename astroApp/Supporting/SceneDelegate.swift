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
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        self.window = window
        self.window?.makeKeyAndVisible()
    }


}

