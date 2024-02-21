//
//  SecondViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 9/3/23.
//

import UIKit

class ZodiacsViewController: UIViewController {

    private var tableView: UITableView = {
        var tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var viewModel: ZodiacViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ZodiacViewModel()
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
        self.navigationItem.title = "Zodiacs"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ZodiacTableViewCell.self, forCellReuseIdentifier: ZodiacTableViewCell.reuseIdentifier)
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension ZodiacsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel{
            return viewModel.zodiacsData.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ZodiacCell", for: indexPath) as? ZodiacTableViewCell, let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        let zodiac = viewModel.zodiacsData[indexPath.row]
        cell.zodiacLabel.text = zodiac.name
        cell.zodiacImage.image = UIImage(named: zodiac.img!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selected = viewModel?.zodiacsData[indexPath.row] {
            let quality = viewModel?.qualityForZodiac(qualityID: selected.qualityID)
            let sign = viewModel?.signForZodiac(signID: selected.signID)
            let zodiacDetailsVC = ZodiacDetailViewController()
            zodiacDetailsVC.zodiac = selected
            zodiacDetailsVC.quality = quality
            zodiacDetailsVC.sign = sign
            navigationController?.pushViewController(zodiacDetailsVC, animated: true)
        }
    }
}
