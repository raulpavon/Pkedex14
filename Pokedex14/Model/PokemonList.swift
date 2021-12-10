//
//  PokemonList.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 27/11/21.
//

import Foundation

struct PokemonList: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let name: String
}
