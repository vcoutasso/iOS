//
//  ContentView.swift
//  Challenge2
//
//  Created by Vinícius Couto on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.conferences) { conference in
                NavigationLink(destination: EmptyView()) {
                    ConferenceView(conference: conference)
                }
            }
            .navigationTitle("Conferences")
            .onAppear{ viewModel.fetchConferences() }
        }
        
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var conferences: [Conference] = []
    private let service: ConferenceService = ConferenceService()
    
    func fetchConferences() {
        service.fetchConferences(then: handleFetchService)
    }
    
    private func handleFetchService(result: Result<[Conference], Error>) {
        switch result {
        case .success(let conferences):
            self.conferences = conferences
        default:
            self.conferences = []
        }
        
        self.objectWillChange.send()
    }
    
}

class ConferenceService {
    func fetchConferences(then handle: (Result<[Conference], Error>) -> Void ) {
        
        // No API to consume so we just declare the data instead
        let data = [
            Conference(conferenceName: "SwiftLeads", city: "Leeds", country: "UK", countryFlag: "🇬🇧"),
            Conference(conferenceName: "MobOS", city: "Cluj-Napoca", country: "Romania", countryFlag: "🇷🇴"),
            Conference(conferenceName: "dot Swift", city: "Paris", country: "France", countryFlag: "🇫🇷"),
            Conference(conferenceName: "Mobilization", city: "Łódź", country: "Polance", countryFlag: "🇵🇱"),
            Conference(conferenceName: "try! Swift Tokyo", city: "Tokyo", country: "Japan", countryFlag: "🇯🇵"),
            Conference(conferenceName: "Mobius", city: "Moscow", country: "Russia", countryFlag: "🇷🇺"),
            Conference(conferenceName: "NSBrazil", city: "São Paulo", country: "Brazil", countryFlag: "🇧🇷"),
            Conference(conferenceName: "MobileOptimized 2019", city: "Minsk", country: "Belarus", countryFlag: "🇧🇾"),
        ]
        
        if data is [Conference] {
            handle(.success(data))
        }
        else {
            handle(.failure(MyError.InvalidData))
        }
        
    }
}

enum MyError: Error {
    case InvalidData
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
