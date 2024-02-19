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
    
    func qualityForZodiac(zodiacId: Int?) -> Quality? {
        return AstrologyDataService.shared.loadData()?.Qualities.first(where: {
            $0.id == zodiacId
        })
    }
    
    func signForZodiac(zodiacId: Int?) -> Sign? {
        return AstrologyDataService.shared.loadData()?.Signs.first(where: {
            $0.id == zodiacId
        })
    }
}
