//
//  ViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 9/3/23.
//

import UIKit

class PlanetsViewController: UIViewController {

    private var tableView: UITableView = {
        var tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var viewModel: PlanetsViewModel? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PlanetsViewModel()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Planets"
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(PlanetTableViewCell.self, forCellReuseIdentifier: PlanetTableViewCell.reuseIdentifier)
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension PlanetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel {
            return  viewModel.planetsData.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlanetTableViewCell.reuseIdentifier, for: indexPath) as? PlanetTableViewCell else {
//            fatalError("Dequeued cell not an instance of CustomTableViewCell.")
            return UITableViewCell()
        }
        
        if let viewModel = viewModel {
                let planet = viewModel.planetsData[indexPath.row]
                cell.planetLabel.text = planet.name
                cell.planetImage.image = UIImage(named: planet.img!)
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let selected = viewModel?.planetsData[indexPath.row] {
            // insert nav logic here for PlanetDetailsView
            let planetDetailsVC = PlanetDetailViewController()
            planetDetailsVC.planet = selected

            navigationController?.pushViewController(planetDetailsVC, animated: true)
        }
    }
    
}

