//
//  ZodiacDetailViewController.swift
//  astroApp
//
//  Created by Jameka Echols on 2/18/24.
//

import UIKit

class ZodiacDetailViewController: UIViewController {
    var zodiac: Zodiac? {
        didSet {
            configure()
        }
    }
    
    var quality: Quality?
    var sign: Sign?
    
    var zodiacImg: UIImageView = {
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
    
    var qualityLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "NexaDemo-Bold", size: 16)
        return lbl
    }()
    
    var signLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "NexaDemo-Bold", size: 16)
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
        if let zodiac = zodiac, let quality = quality, let sign = sign {
            nameLabel.text = zodiac.name
            descriptionLabel.text = zodiac.description
            zodiacImg.image = UIImage(named: zodiac.img!)
            qualityLabel.text = quality.name
            signLabel.text = sign.name
        }
    }

    
    func setupStackView(){
        stackView.addArrangedSubview(zodiacImg)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(qualityLabel)
        stackView.addArrangedSubview(signLabel)
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            zodiacImg.widthAnchor.constraint(equalToConstant: 200),
            zodiacImg.heightAnchor.constraint(equalToConstant: 200),

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
