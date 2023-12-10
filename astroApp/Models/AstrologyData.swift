//
//  AstrologyData.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import Foundation

// define the json coming in and conforms to Codable Protocol
struct AstrologyData: Codable {
    let planets: [Planet]
    let houses: [House]
    let aspects: [Aspect]
    let zodiacs: [Zodiac]
    let qualities: [Quality]
    let signs: [Sign]
}
