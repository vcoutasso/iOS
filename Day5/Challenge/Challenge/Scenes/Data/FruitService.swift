//
//  FruitService.swift
//  Challenge
//
//  Created by Vinícius Couto on 02/06/21.
//

import Foundation

class FruitService {
    func fetchFruits(then handle: (Result<[Fruit], DataError>) -> Void) {
        let result = getFruitData()
     
        switch result {
        case .success(let data):
            handle(.success(data))
        default:
            handle(.failure(DataError.InvalidData))
        }
    }
}
