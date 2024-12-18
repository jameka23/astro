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
    
    func getPlanet(id: Int?) -> Planet? {
        guard let id = id else {
            return nil
        }
        
        let planet =  planetsData.first(where: {
            $0.id == id
        })
        
        var zodiacData = ZodiacViewModel().getZodiac(id: planet?.zodiacID)
        planet?.Zodiac = zodiacData
        
        return planet
    }
}
