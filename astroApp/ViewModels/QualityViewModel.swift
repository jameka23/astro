//
//  QualityViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 2/18/24.
//

import Foundation

class QualityViewModel {
    var qualityData: [Quality] = []
    
    init() {
        if let loadedData = AstrologyDataService.shared.loadData() {
            qualityData = loadedData.Qualities
        } else {
            print("Error: Could not load qualities data.")
        }
    }
}
