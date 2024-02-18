//
//  HousesViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 2/18/24.
//

import Foundation

class HousesViewModel {
    var housesData: [House] = []
    
    init() {
        // Method to load data
        if let loadedData = AstrologyDataService.shared.loadData() {
            self.housesData = loadedData.Houses // Make sure 'planets' matches the property name in AstrologyData
        } else {
            print("Error: Could not load houses data.")
            // Handle error as appropriate for your app
        }
    }
}
