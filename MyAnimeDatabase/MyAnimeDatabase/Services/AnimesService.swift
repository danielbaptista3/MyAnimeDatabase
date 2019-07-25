// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let anime = try? newJSONDecoder().decode(Anime.self, from: jsonData)

import Foundation

// MARK: - AnimeElement
class AnimeElement: Codable {
    let id: Int
    let nom, sequel, prequel: String
    let episode: Int
    let url: String
    
    init(id: Int, nom: String, sequel: String, prequel: String, episode: Int, url: String) {
        self.id = id
        self.nom = nom
        self.sequel = sequel
        self.prequel = prequel
        self.episode = episode
        self.url = url
    }
}

typealias Anime = [AnimeElement]
