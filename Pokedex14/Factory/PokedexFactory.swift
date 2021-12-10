//
//  PokedexFactory.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import Foundation

protocol PokedexFactory {
    func makePokedexViewController(pokedexCoordinator: PokedexCoordinator) -> PokedexViewController
    func makePokedexDetailViewController(pokedexCoordinator: PokedexCoordinator, pokemon: Pokemon) -> PokedexDetailViewController
}

class PokedexFactoryImp: PokedexFactory {
    
    func makePokedexViewController(pokedexCoordinator: PokedexCoordinator) -> PokedexViewController {
        let pokedexViewController = PokedexViewController(factory: self, pokedexCoordinator: pokedexCoordinator)
        return pokedexViewController
    }
    
    func makePokedexDetailViewController(pokedexCoordinator: PokedexCoordinator, pokemon: Pokemon) -> PokedexDetailViewController {
        let pokedexDetailViewController = PokedexDetailViewController(factory: self, pokedexCoordinator: pokedexCoordinator, pokemon: pokemon)
        return pokedexDetailViewController
    }
}
