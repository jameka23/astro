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
        didSet {
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
        lbl.font = UIFont(name: "NexaDemo-Bold", size: 25)
        return lbl
    }()
    
    var rulingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var descriptionLabel: UILabel = {
        let tv = UILabel()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.numberOfLines = 3
        tv.lineBreakMode = .byWordWrapping
        tv.textAlignment = .center
        tv.font = UIFont(name: "Nexa Demo", size: 16)
        return tv
    }()
    
    var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 0
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
        self.view.backgroundColor = .white
        setupStackView()
        configure()
    }
    
    func configure(){
        if let planet = planet {
            nameLabel.text = planet.name
            descriptionLabel.text = planet.description
            planetImg.image = UIImage(named: planet.img!)

        }
    }

    
    func setupStackView(){
        stackView.addArrangedSubview(planetImg)
        stackView.addArrangedSubview(nameLabel)
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            planetImg.widthAnchor.constraint(equalToConstant: 200),
            planetImg.heightAnchor.constraint(equalToConstant: 200),

            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            containerView.widthAnchor.constraint(equalToConstant: 400),
            containerView.heightAnchor.constraint(equalToConstant: 600),
            
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 400),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
