//
//  ContentView.swift
//  Challenge3
//
//  Created by Vinícius Couto on 27/05/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("disc-play")
            VStack(alignment: .leading) {
                Text("Preferidas")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Color("title-color"))
                Text("""
                    Playlist criada por \
                    \(Text("Kassandra").font(.system(size: 16, weight: .semibold, design: .rounded)))
                    """)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    let musics: Int
    let minutes: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(Text("\(musics) músicas").fontWeight(.semibold)) - \(minutes) minutos")
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.secondary)
            TextField("Search", text: $searchText)
                .font(.system(size: 17, weight: .regular, design: .default))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(10)
                .padding(.leading, 30)
                .background(Color("search-bar-color"))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                    }
                )
                .foregroundColor(Color("search-bar-text"))
                .frame(width: 337, height: 36, alignment: .center)
        }
    }
}

struct Song: Identifiable {
    let id = UUID()
    let name: String
    let artist: String
    let albumImageName: String
    let lengthInMinutes: Double
    let spotifyURL: URL
    
    func contains(text: String) -> Bool {
        let lowercased = text.lowercased()
        
        return name.lowercased().contains(lowercased) || artist.lowercased().contains(lowercased)
    }
}

struct MusicView: View {
    
    let music: Song
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(music.albumImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 66, height: 66)
                        .cornerRadius(13, corners: [.topLeft, .topRight, .bottomRight])
                    VStack(alignment: .leading) {
                        Text(music.name)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(Color("music-name-color"))
                        Text(music.artist)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.secondary)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            VStack(alignment: .trailing) {
                Button(action: {
                    UIApplication.shared.open(music.spotifyURL)
                }, label: {
                    Image("play")
                        .frame(alignment: .trailing)
                })
            }
        }
        .padding([.top, .bottom], 8)
    }
}


struct ContentView: View {
    
    @State var searchText: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    let playlist = [
        Song(name: "I Could Die for You", artist: "Red Hot Chili Peppers", albumImageName: "cover-rhcp", lengthInMinutes: 3.2, spotifyURL: URL(string: "https://open.spotify.com/track/3oP2vxUR2bjFCrU9YolGnM?si=d273f23c11f64bdf")!),
        Song(name: "Empire Ants", artist: "Gorillaz", albumImageName: "cover-gorillaz", lengthInMinutes: 4.72, spotifyURL: URL(string: "https://open.spotify.com/track/3a6PN6BRB8PP3ms48s7kU1?si=016e850be040433e")!),
        Song(name: "Black Out Days", artist: "Phantogram", albumImageName: "cover-phantogram", lengthInMinutes: 3.78, spotifyURL: URL(string: "https://open.spotify.com/track/2IWtloZYQDcP8Ashwx8QEF?si=d7d22d2d1f9843d5")!),
        Song(name: "Breezeblocks", artist: "alt-J", albumImageName: "cover-altj", lengthInMinutes: 3.78, spotifyURL: URL(string: "https://open.spotify.com/track/3Wu6MhnZuLuzfH5wFC2g9i?si=972c939efb4240eb")!),
        Song(name: "Slide Away", artist: "Miley Cyrus", albumImageName: "cover-miley", lengthInMinutes: 3.88, spotifyURL: URL(string: "https://open.spotify.com/track/44ADyYoY5liaRa3EOAl4uf?si=c57a1e6da66b46bf")!),
        Song(name: "Tadow", artist: "Masego", albumImageName: "cover-masego", lengthInMinutes: 5.02, spotifyURL: URL(string: "https://open.spotify.com/track/51rPRW8NjxZoWPPjnRGzHw?si=40c9e5c8251f4ce9")!),
        Song(name: "One", artist: "Metallica", albumImageName: "cover-metallica", lengthInMinutes: 7.45, spotifyURL: URL(string: "https://open.spotify.com/track/5IX4TbIR5mMHGE4wiWwKW0?si=ac1f7e0448c24599")!),
        Song(name: "BURN IT DOWN", artist: "Linkin Park", albumImageName: "cover-lp", lengthInMinutes: 3.83, spotifyURL: URL(string: "https://open.spotify.com/track/7oVEtyuv9NBmnytsCIsY5I?si=62b86f494be14a2f")!),
        Song(name: "You Know How We Do It", artist: "Ice Cube", albumImageName: "cover-ice", lengthInMinutes: 3.87, spotifyURL: URL(string: "https://open.spotify.com/track/67ncYmW29pNJJY2yXuLPwT?si=a9cd4ab5f2bb41c7")!),
        Song(name: "Teddy Picker", artist: "Arctic Monkeys", albumImageName: "cover-am", lengthInMinutes: 2.75, spotifyURL: URL(string: "https://open.spotify.com/track/5kxVyCgEUND7E2QKG7JmoF?si=0512aee1749d4384")!),
    ]

    var body: some View {
        ScrollView {
            HeaderView()
                .padding(.top, 60)
            let filtered = playlist.filter{searchText.isEmpty || $0.contains(text: searchText) }
            SearchBarView(searchText: $searchText, musics: filtered.count, minutes: Int(filtered.map{ $0.lengthInMinutes }.reduce(0, +).rounded()))
                .padding(.bottom, 20)
            ForEach(filtered) { music in
                MusicView(music: music)
                    .frame(minWidth: 0, maxWidth: .infinity)
                Divider()
            }
            .padding(.horizontal, 25)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("gradient-lower"), Color("gradient-upper")]), startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
