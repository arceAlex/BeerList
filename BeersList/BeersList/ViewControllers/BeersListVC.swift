//
//  ViewController.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import UIKit

class BeersListVC: UIViewController {
    var beersListView = BeersListView()
    var beersListPresenter = BeersListPresenter()
    var beers : [BeerModel]?
    var pageNumber : String = String(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Beers By Food"
        beersListPresenter.delegate = self
        beersListView.beersTableView.dataSource = self
        beersListView.beersTableView.register(BeerTableViewCell.self, forCellReuseIdentifier: "BeerTableViewCell")
        view.addSubview(beersListView)
        beersListView.searchField.addTarget(self, action: #selector(searchFieldDidChange(_:)), for: .editingChanged)
        beersListView.nextPageButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        beersListView.previousPageButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        beersListView.previousPageButton.isHidden = true
        beersListView.nextPageButton.isHidden = true
        setSafeArea()
    }
    @objc func previousButtonTapped() {
        beersListPresenter.goToPreviousPage()
    }
    @objc func nextButtonTapped() {
        beersListPresenter.goToNextPage()
    }
    @objc func searchFieldDidChange(_ textField : UITextField) {
        beersListPresenter.pageNumber = String(1)
        guard let foodToSearch = textField.text, textField.text?.isEmpty == false else {
            return
        }
        
        let actualText = textField.text
        DispatchQueue.main.asyncAfter(deadline: .now() + AppConstants.DELAYTIMETOSEARCH){
            if actualText == textField.text {
                self.searchByFood(food: foodToSearch.replacingOccurrences(of: " ", with: "_"),pageNumber: self.pageNumber)
            }
        }
    }
    func searchByFood(food : String, pageNumber : String) {
        beersListPresenter.getBeers(foodName: food, pageNumber: pageNumber)
    }
    
    func setSafeArea() {
        beersListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            beersListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            beersListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            beersListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            beersListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension BeersListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let beers = beers else {
            return 0
        }
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell", for: indexPath) as! BeerTableViewCell
        guard let beers = beers else {
            return cell
        }
        let myBeer = beers[indexPath.row]
        cell.beerModel = myBeer
        if let name = myBeer.name {
            cell.beerTitle.text = name
        } else {
            cell.beerTitle.text = "No name available"
        }
        cell.delegate = self
        return cell
    }
}
extension BeersListVC : BeersListPresenterDelegate {
    func activateNextButton() {
        DispatchQueue.main.async {
            self.beersListView.nextPageButton.isHidden = false
        }
    }
    
    func hideNextButton() {
        DispatchQueue.main.async {
            self.beersListView.nextPageButton.isHidden = true
        }
    }
    
    func activatePreviousButton() {
        DispatchQueue.main.async {
            self.beersListView.previousPageButton.isHidden = false
        }
    }
    
    func hidePreviousButton() {
        DispatchQueue.main.async {
            self.beersListView.previousPageButton.isHidden = true
        }
    }
    
    func sendBeers(beers: [BeerModel]) {
        self.beers = beers
        DispatchQueue.main.async {
            self.beersListView.beersTableView.reloadData()
        }
        
    }
}
extension BeersListVC : BeerTableViewCellDelegate {
    func tapCell(cell: BeerTableViewCell) {
        let detailView = BeerDetailVC()
        detailView.beerModel = cell.beerModel
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
