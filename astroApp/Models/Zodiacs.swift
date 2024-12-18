//
//  Zodiacs.swift
//  astroApp
//
//  Created by Jameka Echols on 11/18/23.
//

import Foundation

struct Zodiac: Codable {
    let id: Int?
    let name: String?
    let signID: Int?
    let qualityID: Int?
    let description: String?
    let img: String?
    var sign: Sign?
    var quality: Quality?
}
