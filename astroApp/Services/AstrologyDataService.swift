//
//  AstrologyDataService.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import Foundation

class AstrologyDataService {
    static let shared = AstrologyDataService() // singleton design pattern : single source of truth
    
    func loadData() -> AstrologyData? {
        
        guard let url = Bundle.main.url(forResource: "astrologyData", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AstrologyData.self, from: data)
        } catch {
            print("error decoding your json: \(error)")
            return nil
        }
    }
}


