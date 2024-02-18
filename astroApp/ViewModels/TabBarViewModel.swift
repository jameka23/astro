//
//  TabBarViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 2/17/24.
//

import Foundation
import UIKit

struct TabBarItemViewModel {
    let viewController: UIViewController?
    let title: String?
    let icon: UIImage?
    let selectedIcon: UIImage?
}

class TabBarViewModel {
    let tabs : [TabBarItemViewModel] = [
        TabBarItemViewModel(viewController: PlanetsViewController(), title: "Planets", icon: UIImage(named: "planet")?.withRenderingMode(.alwaysOriginal), selectedIcon: nil),
        TabBarItemViewModel(viewController: ZodiacsViewController(), title: "Zodiacs", icon: UIImage(named: "zodiac")?.withRenderingMode(.alwaysOriginal), selectedIcon: nil),
        TabBarItemViewModel(viewController: HousesViewController(), title: "Houses", icon: UIImage(named: "house")?.withRenderingMode(.alwaysOriginal), selectedIcon: nil),
        TabBarItemViewModel(viewController: AspectsViewController(), title: "Aspects", icon: UIImage(named: "aspect")?.withRenderingMode(.alwaysOriginal), selectedIcon: nil)
    ]
    
}
