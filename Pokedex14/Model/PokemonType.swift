//
//  PokemonType.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 29/11/21.
//

import Foundation

struct PokemonType: Codable {
    var pokemon: [Pokemon]
    
    init() {
        self.pokemon = []
    }
}


