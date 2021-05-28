//
//  ConferenceView.swift
//  Challenge2
//
//  Created by Vinícius Couto on 28/05/21.
//

import SwiftUI

struct Conference: Identifiable {
    let id = UUID()
    let conferenceName: String
    let city: String
    let country: String
    let countryFlag: String
    /*let conferenceInfo: ConferenceInfo
    
    struct ConferenceInfo {
        let data: String
        let website: String
    }*/
}

struct ConferenceView: View {
    
    let conference: Conference
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(conference.conferenceName)
                .font(.system(size: 16, weight: .bold, design: .default))
            Text("\(conference.countryFlag) \(conference.city), \(conference.country)")
                .font(.system(size: 14))
        }
    }
}
