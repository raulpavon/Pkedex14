//
//  Pokemon.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [Types]
    let stats: [Stats]
    
    init(name: String) {
        self.id = 0
        self.name = name
        self.sprites = Sprites()
        self.types = []
        self.stats = []
    }
    
    init() {
        self.id = 0
        self.name = ""
        self.sprites = Sprites()
        self.types = []
        self.stats = []
    }
}

struct Sprites: Codable {
    let frontDefault: String
    let frontShiny: String
    
    init(frontDefault: String, frontShiny: String) {
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
    
    init() {
        self.frontDefault = ""
        self.frontShiny = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

struct Types: Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
}

struct Stats: Codable {
    let baseStat: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct Stat: Codable {
    let name: String
    let url: String
}
