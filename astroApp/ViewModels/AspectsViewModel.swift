//
//  AspectsViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 2/18/24.
//

import Foundation

class AspectsViewModel {
    var aspectsData: [Aspect] = []
    
    init() {
        // Method to load data
        if let loadedData = AstrologyDataService.shared.loadData() {
            self.aspectsData = loadedData.Aspects // Make sure 'planets' matches the property name in AstrologyData
        } else {
            print("Error: Could not load aspects data.")
            // Handle error as appropriate for your app
        }
    }
}
