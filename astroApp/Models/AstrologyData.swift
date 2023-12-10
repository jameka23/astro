//
//  AstrologyData.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import Foundation

// define the json coming in and conforms to Codable Protocol
struct AstrologyData: Codable {
    let Planets: [Planet]
    let Houses: [House]
    let Aspects: [Aspect]
    let Zodiacs: [Zodiac]
    let Qualities: [Quality]
    let Signs: [Sign]
}
