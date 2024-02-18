//
//  SignViewModel.swift
//  astroApp
//
//  Created by Jameka Echols on 2/18/24.
//

import Foundation

class SignViewModel {
    var signsData: [Sign] = []
    
    init() {
        if let loadedData = AstrologyDataService.shared.loadData() {
            self.signsData = loadedData.Signs
        } else {
            print("Error: Could not load signs data.")
        }
    }
}
