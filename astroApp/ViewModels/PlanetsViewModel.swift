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
        // Method to load data
        if let loadedData = AstrologyDataService.shared.loadData() {
            self.planetsData = loadedData.Planets // Make sure 'planets' matches the property name in AstrologyData
        } else {
            print("Error: Could not load planet data.")
            // Handle error as appropriate for your app
        }
    }
}
