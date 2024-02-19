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
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
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
//            let zodiacDetailsVC = Zodiacs
        }
    }
}
