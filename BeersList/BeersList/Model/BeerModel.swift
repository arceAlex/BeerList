//
//  BeerModel.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation

struct BeerModel : Decodable {
    let name : String
    let image_url : String
    let description : String
    let food_pairing : [String]
    let abv : Double
    let ibu : Double?
    let ebc : Double?
    let srm : Double?
    let ph : Double?
    let attenuation_level : Double?
}
