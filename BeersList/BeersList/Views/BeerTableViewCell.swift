//
//  BeerTableViewCell.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation
import UIKit

protocol BeerTableViewCellDelegate {
    func tapCell(cell: BeerTableViewCell)
}

class BeerTableViewCell : UITableViewCell {
    var delegate : BeerTableViewCellDelegate?
    //var beerModel = BeerModel(name: "", image_url: "",description: "",food_pairing: [], abv: 0, ibu: 0, ebc: 0)
    var beerModel = BeerModel(name: "", image_url: "", description: "", food_pairing: [], abv: 0, ibu: 0, ebc: 0, srm: 0, ph: 0, attenuation_level: 0)
    lazy var beerTitle : UILabel = {
        let beerTitle = UILabel(frame: CGRect(x: 20, y: 7.5, width: UIScreen.main.bounds.width - 125, height: 30))
        beerTitle.textColor = .black
        beerTitle.font = beerTitle.font.withSize(15)
        return beerTitle
    }()
    lazy var cellButton : UIButton = {
        let cellButton = UIButton()
        cellButton.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 105, height: UIScreen.main.bounds.height)
        cellButton.addTarget(self, action: #selector(tapCell), for: .touchUpInside)
        return cellButton
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(beerTitle)
        contentView.addSubview(cellButton)
    }
    @objc func tapCell() {
        delegate?.tapCell(cell: self)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
