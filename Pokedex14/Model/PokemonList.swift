//
//  PokemonList.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 27/11/21.
//

import Foundation

struct PokemonList: Codable {
    let results: [Results]
    
    init() {
        self.results = [Results]()
    }
}

struct Results: Codable {
    let name: String
    
    init() {
        self.name = ""
    }
}
