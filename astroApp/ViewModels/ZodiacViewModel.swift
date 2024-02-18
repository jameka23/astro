//
//  ZodiacViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 2/18/24.
//

import Foundation

class ZodiacViewModel {
    var zodiacsData: [Zodiac] = []
    
    init() {
        if let loadedData = AstrologyDataService.shared.loadData() {
            self.zodiacsData = loadedData.Zodiacs
        } else {
            print("Error: Counld not load zodiac data.")
        }
        
    }
}
