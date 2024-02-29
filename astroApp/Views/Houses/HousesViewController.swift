//
//  HousesViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import Foundation
import UIKit

class HousesViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var viewModel: HousesViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HousesViewModel()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Houses"
        
        tableView.register(HousesTableViewCell.self, forCellReuseIdentifier: HousesTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HousesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel {
            return viewModel.housesData.count
        } else {
             return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HousesTableViewCell.reuseIdentifier, for: indexPath) as? HousesTableViewCell else {
            return UITableViewCell()
        }
        
        if let viewModel = viewModel {
            let house = viewModel.housesData[indexPath.row]
            cell.houseLabel.text = house.name
            cell.houseImage.image = UIImage(named: house.img!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selected = viewModel?.housesData[indexPath.row] {
            let houseDetailVC = HouseDetailViewController()
            houseDetailVC.house = selected
            navigationController?.pushViewController(houseDetailVC, animated: true)
        }
    }
    
}
