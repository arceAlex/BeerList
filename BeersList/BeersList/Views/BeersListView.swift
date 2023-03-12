//
//  BeersListView.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation
import UIKit

class BeersListView : UIView {
    var searchField : UITextField = {
        let searchField = UITextField()
        searchField.borderStyle = .bezel
        searchField.placeholder = "Search Matched Foods"
        searchField.textColor = .black
        searchField.backgroundColor = .white
        return searchField
    }()
    var beersTableView : UITableView = {
        let beersTableView = UITableView()
        beersTableView.allowsSelection = false
        beersTableView.backgroundColor = .white
        return beersTableView
    }()
    var nextPageButton : UIButton = {
        let nextPageButton = UIButton()
        nextPageButton.setTitle("NEXT >", for: .normal)
        nextPageButton.setTitleColor(.blue, for: .normal)
        nextPageButton.contentHorizontalAlignment = .trailing
        return nextPageButton
    }()
    var previousPageButton : UIButton = {
        let previousPageButton = UIButton()
        previousPageButton.setTitle("< PREVIOUS", for: .normal)
        previousPageButton.setTitleColor(.blue, for: .normal)
        previousPageButton.contentHorizontalAlignment = .leading
        return previousPageButton
    }()
    init() {
        super.init(frame: UIScreen.main.bounds)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func config() {
        addSubview(searchField)
        addSubview(beersTableView)
        addSubview(nextPageButton)
        addSubview(previousPageButton)
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        beersTableView.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        previousPageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            searchField.topAnchor.constraint(equalTo: topAnchor),
            searchField.heightAnchor.constraint(equalToConstant: 50),
            searchField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            searchField.widthAnchor.constraint(equalToConstant: 200),
            
            beersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            beersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            beersTableView.topAnchor.constraint(equalTo: searchField.bottomAnchor),
            beersTableView.bottomAnchor.constraint(equalTo: previousPageButton.topAnchor),
            
            previousPageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            previousPageButton.widthAnchor.constraint(equalToConstant: 150),
            previousPageButton.topAnchor.constraint(equalTo: beersTableView.bottomAnchor),
            previousPageButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nextPageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -10),
            nextPageButton.widthAnchor.constraint(equalToConstant: 150),
            nextPageButton.topAnchor.constraint(equalTo: beersTableView.bottomAnchor),
            nextPageButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
}
