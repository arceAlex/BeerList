//
//  BeerDetailVC.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation
import UIKit

class BeerDetailVC : UIViewController {
    let beerDetailPresenter = BeerDetailPresenter()
    //var beerModel = BeerModel(name: "", image_url: "",description: "",food_pairing: [], abv: 0,ibu: 0, ebc: 0 )
    var beerModel = BeerModel(name: "", image_url: "", description: "", food_pairing: [], abv: 0, ibu: 0, ebc: 0, srm: 0, ph: 0, attenuation_level: 0)
    let beerDetailView = BeerDetailView()
    var beerImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(beerDetailView)
        beerDetailPresenter.delegate = self
        self.title = beerModel.name
        setTexts()
        setImage()
        setSafeArea()
    }
    func setTexts(){
        beerDetailView.beerDescription.text = beerModel.description
        beerDetailView.foodPairing.text = beerModel.food_pairing.joined(separator: "\n")
        beerDetailView.abvLabel.text = "abv: \(beerModel.abv)"
        if let ibu = beerModel.ibu {
            beerDetailView.ibuLabel.text = "ibu: \(ibu)"
        } else {
            beerDetailView.ibuLabel.text = "ibu: unknown"
        }
        if let ebc = beerModel.ebc {
            beerDetailView.ebcLabel.text = "ebc: \(ebc)"
        } else {
            beerDetailView.ebcLabel.text = "ebc: unknown"
        }
        if let srm = beerModel.srm {
            beerDetailView.srmLabel.text = "srm: \(srm)"
        } else {
            beerDetailView.srmLabel.text = "srm: unknown"
        }
        
        if let ph = beerModel.ph {
            beerDetailView.phLabel.text = "ph: \(ph)"
        } else {
            beerDetailView.phLabel.text = "ph: unknown"
        }

        if let attenuationLevel = beerModel.attenuation_level {
            beerDetailView.attenuationLabel.text = "Attenuation: \(attenuationLevel)"
        } else {
            beerDetailView.attenuationLabel.text = "Attenuation: unknown"
        }
        
    }
    func setImage() {
        beerDetailPresenter.getBeerImage(url: beerModel.image_url)
    }
    func setSafeArea() {
        beerDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            beerDetailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            beerDetailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            beerDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            beerDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension BeerDetailVC : BeerDetailPresenterDelegate {
    func setDetailImage(imageData: Data) {
        self.beerDetailView.beerImage.image = UIImage(data: imageData)
    }
    
    
}
