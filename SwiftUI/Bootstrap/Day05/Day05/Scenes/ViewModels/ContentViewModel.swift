//
//  ContentViewModel.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var fruits: [Fruit] = []
    private let service: FruitService = FruitService()
    
    func fetchFruits() {
        service.fetchFruits(then: handleFetchService)
    }
    
    private func handleFetchService(result: Result<[Fruit], DataError>) {
        switch result {
        case .success(let data):
            self.fruits = data
        default:
            self.fruits = []
        }
        
        self.objectWillChange.send()
    }
}
