//
//  CustomTabBarController.swift
//  astroApp
//
//  Created by Jameka Echols on 12/18/23.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeHeightOffTabbar()
    }
    
    func configureUI(){
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 20
        tabBar.layer.backgroundColor = UIColor.white.cgColor
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .clear
        let customFont = UIFont(name: "Nexa Demo", size: 10) ?? UIFont.systemFont(ofSize: 10)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: UIColor.purple], for: .normal)
    }
    
    func changeHeightOffTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            let horizontalMargin: CGFloat = 15
            tabFrame.size.height = 60
            tabFrame.size.width = view.frame.size.width - 2 * horizontalMargin
            tabFrame.origin.x = horizontalMargin
            tabFrame.origin.y = view.frame.size.height - 85
            tabBar.frame = tabFrame

        }
    }
}


