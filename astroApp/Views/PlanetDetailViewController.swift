//
//  PlanetDetailViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 12/10/23.
//

import Foundation
import UIKit

class PlanetDetailViewController: UIViewController{
    var planet: Planet? {
        didSet{
            configure()
        }
    }
    
    var planetImg: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var rulingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var descriptionLabel: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 3
        sv.distribution = .fill
        sv.alignment = .center
        return sv
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configure()
    }
    
    func configure(){
        nameLabel.text = planet?.name
        descriptionLabel.text = planet?.description
        planetImg.image = UIImage(named: (planet?.img)!)
    }
    
    func setupStackView(){
        stackView.addArrangedSubview(planetImg)
        stackView.addArrangedSubview(nameLabel)
//        stackView.addArrangedSubview(rulingLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            planetImg.widthAnchor.constraint(equalToConstant: 75),
            planetImg.heightAnchor.constraint(equalToConstant: 75)
            
        ])
    }
}
