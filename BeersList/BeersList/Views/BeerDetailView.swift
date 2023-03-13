//
//  BeerDetailView.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation
import UIKit

class BeerDetailView : UIView {
    var abvLabel : UILabel = {
        let abvLabel = UILabel()
        return abvLabel
    }()
    var ibuLabel : UILabel = {
        let ibuLabel = UILabel()
        return ibuLabel
    }()
    var ebcLabel : UILabel = {
        let ebcLabel = UILabel()
        return ebcLabel
    }()
    var srmLabel : UILabel = {
        let srmLabel = UILabel()
        return srmLabel
    }()
    var phLabel : UILabel = {
        let phLabel = UILabel()
        return phLabel
    }()
    var attenuationLabel : UILabel = {
        let attenuationLabel = UILabel()
        return attenuationLabel
    }()
    var beerImage : UIImageView = {
        let beerImage = UIImageView()
        beerImage.contentMode = .scaleAspectFit
        return beerImage
    }()
    var descriptionLabel : UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "BEER DESCRIPTION"
        return descriptionLabel
    }()
    var beerDescription : UITextView = {
        let beerDescription = UITextView()
        beerDescription.contentOffset = CGPoint(x: 0, y: (beerDescription.contentSize.height - beerDescription.frame.size.height) / 2)
        return beerDescription
    }()
    var matchedFoodLabel : UILabel = {
        let matchedFoodLabel = UILabel()
        matchedFoodLabel.text = "Matched Foods"
        return matchedFoodLabel
    }()
    var foodPairing : UITextView = {
        let foodPairing = UITextView()
        return foodPairing
    }()
    init() {
        super.init(frame: UIScreen.main.bounds)
        config()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func config(){
        addSubview(abvLabel)
        addSubview(ibuLabel)
        addSubview(ebcLabel)
        addSubview(srmLabel)
        addSubview(phLabel)
        addSubview(attenuationLabel)
        addSubview(beerImage)
        addSubview(descriptionLabel)
        addSubview(beerDescription)
        addSubview(matchedFoodLabel)
        addSubview(foodPairing)
        abvLabel.translatesAutoresizingMaskIntoConstraints = false
        ibuLabel.translatesAutoresizingMaskIntoConstraints = false
        ebcLabel.translatesAutoresizingMaskIntoConstraints = false
        srmLabel.translatesAutoresizingMaskIntoConstraints = false
        phLabel.translatesAutoresizingMaskIntoConstraints = false
        attenuationLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        beerDescription.translatesAutoresizingMaskIntoConstraints = false
        matchedFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        beerImage.translatesAutoresizingMaskIntoConstraints = false
        foodPairing.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            abvLabel.topAnchor.constraint(equalTo: topAnchor),
            abvLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            abvLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            abvLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ibuLabel.topAnchor.constraint(equalTo: abvLabel.bottomAnchor, constant: 36),
            ibuLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ibuLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            ibuLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ebcLabel.topAnchor.constraint(equalTo: ibuLabel.bottomAnchor, constant: 36),
            ebcLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ebcLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            ebcLabel.heightAnchor.constraint(equalToConstant: 20),
            
            srmLabel.topAnchor.constraint(equalTo: ebcLabel.bottomAnchor, constant: 36),
            srmLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            srmLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            srmLabel.heightAnchor.constraint(equalToConstant: 20),
            
            phLabel.topAnchor.constraint(equalTo: srmLabel.bottomAnchor, constant: 36),
            phLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            phLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            phLabel.heightAnchor.constraint(equalToConstant: 20),
            
            attenuationLabel.topAnchor.constraint(equalTo: phLabel.bottomAnchor, constant: 36),
            attenuationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            attenuationLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10),
            attenuationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            beerImage.topAnchor.constraint(equalTo: topAnchor),
            beerImage.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            beerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            beerImage.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.topAnchor.constraint(equalTo: beerImage.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            beerDescription.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            beerDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            beerDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            beerDescription.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -200),
            
            matchedFoodLabel.topAnchor.constraint(equalTo: beerDescription.bottomAnchor, constant: 10),
            matchedFoodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            matchedFoodLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            matchedFoodLabel.heightAnchor.constraint(equalToConstant: 20),
            
            foodPairing.topAnchor.constraint(equalTo: matchedFoodLabel.bottomAnchor, constant: 10),
            foodPairing.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            foodPairing.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            foodPairing.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
