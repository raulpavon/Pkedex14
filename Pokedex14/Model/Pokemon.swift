//
//  Pokemon.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [Types]
    let stats: [Stats]
    
    init() {
        self.id = 0
        self.name = ""
        self.sprites = Sprites()
        self.types = []
        self.stats = []
    }
}

struct Sprites: Decodable {
    let front_default: String
    let front_shiny: String
    
    init(front_default: String, front_shiny: String) {
        self.front_default = front_default
        self.front_shiny = front_shiny
    }
    
    init() {
        self.front_default = ""
        self.front_shiny = ""
    }
}

struct Types: Decodable {
    let type: Type
}

struct Type: Decodable {
    let name: String
}

struct Stats: Decodable {
    let base_stat: Int
    let stat: Stat
}

struct Stat: Decodable {
    let name: String
    let url: String
}
