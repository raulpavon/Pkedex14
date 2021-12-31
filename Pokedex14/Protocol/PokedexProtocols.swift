//
//  PokedexProtocols.swift
//  Pokedex14
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

protocol PokedexView: AnyObject {
    func setPokemonList(pokemonList: [Results])
    func setPokemonListType(pokemonType: PokemonType)
    func setPokemon(pokemon: Pokemon)
    func goToPokemonDetail(pokemon: Pokemon)
}

protocol PokedexViewModel {
    func getPokemonList()
    func getPokemonDetail<T>(_ text: T)
    func getpokemonType(type: String)
}
