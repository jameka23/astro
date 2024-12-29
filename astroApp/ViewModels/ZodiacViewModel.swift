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

    func getZodiac(id: Int?) -> Zodiac? {
        guard let id = id else {
            return nil
        }
        
        var zodiac = zodiacsData.first(where: {
            $0.id == id
        } )
        
        let quality = QualityViewModel().getQuality(id: zodiac?.qualityID)
        let sign = SignViewModel().getSign(id: zodiac?.signID)
        
        zodiac?.quality = quality
        zodiac?.sign = sign
        
        return zodiac
    }
}
