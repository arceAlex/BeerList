//
//  BeerDetailPresenter.swift
//  BeersList
//
//  Created by Alejandro Arce on 11/3/23.
//

import Foundation
protocol BeerDetailPresenterDelegate {
    func setDetailImage(imageData: Data)
}

class BeerDetailPresenter {
    var delegate : BeerDetailPresenterDelegate?
    func getBeerImage(url: String){
        BeerApi.downloadBeerImage(url: URL(string: url)!) { result in
            switch result {
                
            case .success(let imageData):
                DispatchQueue.main.async {
                    print("Image donloaded")
                    self.delegate?.setDetailImage(imageData: imageData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
