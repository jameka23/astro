//
//  Aspects.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import Foundation
import UIKit

class AspectsViewController: UIViewController {
    private var tableView: UITableView = {
        var tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var viewModel: AspectsViewModel? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AspectsViewModel()
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
        self.navigationItem.title = "Aspects"
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(AspectsTableViewCell.self, forCellReuseIdentifier: AspectsTableViewCell.reuseIdentifier)
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension AspectsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel {
            return viewModel.aspectsData.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AspectsTableViewCell.reuseIdentifier, for: indexPath) as? AspectsTableViewCell else {
            return UITableViewCell()
        }
        
        if let viewModel = viewModel {
            let aspect = viewModel.aspectsData[indexPath.row]
            cell.aspectImage.image = UIImage(named: aspect.img!)
            cell.aspectLabel.text = aspect.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selected = viewModel?.aspectsData[indexPath.row] {
            let aspectDetailsVC = AspectDetailViewController()
            aspectDetailsVC.aspect = selected
            
            navigationController?.pushViewController(aspectDetailsVC, animated: true)
        }
    }
}
