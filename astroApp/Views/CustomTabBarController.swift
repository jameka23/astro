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
        tabBar.layer.opacity = 0.7
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tabBar.barTintColor = .blue
        tabBar.backgroundColor = .blue
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


