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
        tabBar.barTintColor = .purple
        tabBar.backgroundColor = .purple
//        tabBar.layer.shadowColor = UIColor.green.cgColor
//        tabBar.standardAppearance.backgroundColor = .black
        
        // Iterate over each tab bar item to adjust the imageInsets
        if let items = tabBar.items {
            for item in items {
                // Move the icon up by 5 points
                item.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 6, right: 0)
                
                // If you also have titles and want to move them, adjust this accordingly
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 5)
            }
        }
    }
    
    func changeHeightOffTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            let horizontalMargin: CGFloat = 15
            tabFrame.size.height = 55
            tabFrame.size.width = view.frame.size.width - 2 * horizontalMargin
            tabFrame.origin.x = horizontalMargin
            tabFrame.origin.y = view.frame.size.height - 80
            tabBar.frame = tabFrame

        }
    }
}


