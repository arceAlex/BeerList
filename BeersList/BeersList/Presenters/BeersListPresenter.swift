//
//  BeerListPresenter.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation

protocol BeersListPresenterDelegate {
    func sendBeers(beers : [BeerModel])
    func activateNextButton()
    func hideNextButton()
    func activatePreviousButton()
    func hidePreviousButton()
    
}

class BeersListPresenter {
    var delegate : BeersListPresenterDelegate?
    var beers : [BeerModel] = []
    var pageNumber: String = String(1)
    var foodNameVar: String = ""
    
    func managePageButtons() {
        delegate?.hideNextButton()
        delegate?.hidePreviousButton()
        if beers.count == Int(AppConstants.BEERSPERPAGE) {
            delegate?.activateNextButton()
        }
        if pageNumber != "1" {
            delegate?.activatePreviousButton()
        }
    }
    func goToNextPage() {
        if var pageNumberInt = Int(pageNumber) {
            pageNumberInt += 1
            pageNumber = String(pageNumberInt)
            getBeers(foodName: foodNameVar, pageNumber: pageNumber)
        }
    }
    func goToPreviousPage() {
        if var pageNumberInt = Int(pageNumber) {
            pageNumberInt -= 1
            if pageNumberInt < 1 { pageNumberInt = 1 }
            pageNumber = String(pageNumberInt)
            getBeers(foodName: foodNameVar, pageNumber: pageNumber)
        }
    }
    func getBeers(foodName : String, pageNumber: String) {
        foodNameVar = foodName
        BeerApi.fetchBeerByFood(foodName: foodName, pageNumber: pageNumber) { result in
            switch result {
                
            case .success(let json):
                self.beers = json
                self.managePageButtons()
                self.delegate?.sendBeers(beers: json)
                print("Descarga correcta")
            case .failure(let error):
                print(error.localizedDescription)
                switch error {
                    
                case .missingData:
                    print("Missing Data")
                case .codeError:
                    print("Code Error")
                case .timeOut:
                    print("Time Out")
                case .defaultError:
                    print("Default Error")
                }
            }
        }
    }
}
