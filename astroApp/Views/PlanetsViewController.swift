//
//  ViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 9/3/23.
//

import UIKit
import SwiftUI

class PlanetsViewController: UIViewController {

    let tableView: UITableView? = nil
    let planetsData: [Planet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
    }
    
}

extension PlanetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

