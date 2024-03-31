//
//  PlanetTableViewCell.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
    static let reuseIdentifier = "PlanetCell"

    var planetLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var planetImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    var stackView : UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 2
        return stack
    }()
    
    
    // Add a container view
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white // Set the background color to match your design
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear // Set the contentView's background to clear
        contentView.addSubview(cardView)
        cardView.addSubview(stackView)
        
        stackView.addArrangedSubview(planetLabel)
        stackView.addArrangedSubview(planetImage)
        contentView.addSubview(stackView)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupConstraints(){
        
        // Card view constraints
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),

            // Your planetImage constraints...

            planetImage.widthAnchor.constraint(equalToConstant: 40),
            planetImage.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    
}
