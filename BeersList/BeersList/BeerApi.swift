//
//  BeerApi.swift
//  BeersList
//
//  Created by Alejandro Arce on 9/3/23.
//

import Foundation
import UIKit

enum JsonError : Error {
    case missingData
    case codeError
    case timeOut
    case defaultError
}

class BeerApi {
    
    static func fetchBeerByFood(foodName: String, pageNumber: String, completion: @escaping(Result<[BeerModel],JsonError>)->Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.punkapi.com"
        components.path = "/v2/beers"
        components.queryItems = [
            URLQueryItem(name: "food", value: foodName),
            URLQueryItem(name: "page", value: pageNumber),
            URLQueryItem(name: "per_page", value: AppConstants.BEERSPERPAGE)
        ]
        
        let url = components.url!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let response = response as? HTTPURLResponse
            
            if let response = response, response.statusCode != 200 && response.statusCode != 408 {
                print("Error \(response.statusCode)")
                completion(.failure(.codeError))
                return
            }
            if let _ = error {
                completion(.failure(.defaultError))
                return
            }
            guard let data = data else {
                completion(.failure(.missingData))
                return
            }
            do {
                let json = try JSONDecoder().decode([BeerModel].self, from: data)
                completion(.success(json))
                return
            } catch let error {
                completion(.failure(.defaultError))
                print(error.localizedDescription)
                return
            }
        }.resume()
    }
    
//    static func fetchBeerByFood(foodName: String, completion: @escaping(Result<[BeerModel],JsonError>)->Void) {
//        let url = URL(string: "https://api.punkapi.com/v2/beers?food=\(foodName)")!
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            let response = response as? HTTPURLResponse
//
//            if let response = response, response.statusCode != 200 && response.statusCode != 408 {
//                print("Error \(response.statusCode)")
//                completion(.failure(.codeError))
//                return
//            }
//            if let _ = error {
//                completion(.failure(.defaultError))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(.missingData))
//                return
//            }
//            do {
//                let json = try JSONDecoder().decode([BeerModel].self, from: data)
//                completion(.success(json))
//                return
//            } catch let error {
//                completion(.failure(.defaultError))
//                print(error.localizedDescription)
//                return
//            }
//        }.resume()
//    }
    static func downloadBeerImage (url: URL, completionImage: @escaping(Result<Data,Error>)->Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Ha habido un error")
                completionImage(.failure(error!))
                return
            }
            completionImage(.success(data))
        }.resume()
    }
}
