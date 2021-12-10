//
//  GlobalConstants.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 30/11/21.
//

import Foundation

enum GlobalConstants {
    enum Pokedex {
        static let pokedexURL = "https://pokeapi.co/api/v2/"
        
        static let httpMethod = "GET"
        
        static let types = ["normal", "fire", "water", "electric", "grass", "ice", "fighting", "poison", "ground", "flying", "psychic", "bug", "rock", "ghost", "dragon", "dark", "steel", "fairy"]
        
        static let searchBarPlaceholder = "Buscar pokemon"
        
        enum PokemonType: String {
            case normal
            case fire
            case water
            case electric
            case grass
            case ice
            case fighting
            case poison
            case ground
            case flying
            case psychic
            case bug
            case rock
            case ghost
            case dragon
            case dark
            case steel
            case fairy
        }

        enum TypeColor: String {
            case normal = "A8A77A"
            case fire = "EE8130"
            case water = "6390F0"
            case electric = "F7D02C"
            case grass = "7AC74C"
            case ice = "96D9D6"
            case fighting = "C22E28"
            case poison = "A33EA1"
            case ground = "E2BF65"
            case flying = "A98FF3"
            case psychic = "F95587"
            case bug = "A6B91A"
            case rock = "B6A136"
            case ghost = "735797"
            case dragon = "6F35FC"
            case dark = "705746"
            case steel = "B7B7CE"
            case fairy = "D685AD"
        }
    }
}
