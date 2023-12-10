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
        stack.spacing = 10
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        stackView.addArrangedSubview(planetLabel)
        stackView.addArrangedSubview(planetImage)
        contentView.addSubview(stackView)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Example constraint for image view
            planetImage.widthAnchor.constraint(equalToConstant: 60) // Adjust as needed
        ])
        
    }
    
    
}
