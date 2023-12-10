//
//  PlanetTableViewCell.swift
//  astroApp
//
//  Created by Jameka Echols on 12/9/23.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {

    var planetLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var planetImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var stackView : UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.alignment = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        stackView.addArrangedSubview(planetLabel)
        stackView.addArrangedSubview(planetImage)
        self.addSubview(stackView)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5)
        ])
        
    }
    
    
}
