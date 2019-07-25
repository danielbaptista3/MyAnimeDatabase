// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personnage = try? newJSONDecoder().decode(Personnage.self, from: jsonData)

import Foundation

// MARK: - PersonnageElement
class PersonnageElement: Codable {
    let id: Int
    let anime, nom, prenom, fullname: String
    let age: Int
    let personnageDescription: String
    let photo: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case id, anime, nom, prenom, fullname, age
        case personnageDescription = "description"
        case photo
    }
    
    init(id: Int, anime: String, nom: String, prenom: String, fullname: String, age: Int, personnageDescription: String, photo: [Photo]) {
        self.id = id
        self.anime = anime
        self.nom = nom
        self.prenom = prenom
        self.fullname = fullname
        self.age = age
        self.personnageDescription = personnageDescription
        self.photo = photo
    }
}

// MARK: - Photo
class Photo: Codable {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}

typealias Personnage = [PersonnageElement]
