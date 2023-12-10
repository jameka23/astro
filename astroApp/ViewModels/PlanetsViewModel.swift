//
//  PlanetsViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import Foundation

class PlanetsViewModel {
    var planetsData: [Planet] = []
    
    init() {
        /// Method to load data
        self.planetsData = AstrologyDataService.shared.loadData()?.planets ?? []
    }
}
