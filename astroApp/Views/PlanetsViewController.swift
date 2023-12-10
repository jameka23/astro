//
//  ViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 9/3/23.
//

import UIKit
import SwiftUI

class PlanetsViewController: UIViewController {

    private var tableView: UITableView = {
        var tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var viewModel: PlanetsViewModel? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        viewModel = PlanetsViewModel()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Planets"
        
        tableView.dataSource = self
        
        // add the custom tableviewcell here..register it
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.leftAnchor)
        ])
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

