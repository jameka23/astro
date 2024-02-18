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
    
    private var viewModel: ZodiacViewModel? = nil
    
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
