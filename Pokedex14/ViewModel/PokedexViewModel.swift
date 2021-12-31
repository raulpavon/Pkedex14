//
//  PokedexViewModel.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import Foundation

class PokedexViewModelImp: PokedexViewModel {
    
    weak var view: PokedexView?
    let pokedexRepository: PokedexRepository
    private var pokemonList = PokemonList()
    private var pokemon = Pokemon()
    private var pokemonType = PokemonType()
    
    required init(view: PokedexView?, pokedexRepository: PokedexRepository) {
        self.view = view
        self.pokedexRepository = pokedexRepository
    }
    
    func getPokemonList() {
        pokedexRepository.performListRequest {
            [weak self] response in
            self?.pokemonList = response
            self?.view?.setPokemonList(pokemonList: self?.pokemonList.results ?? [Results]())
        }
    }
    
    func getPokemonDetail<T>(_ text: T) {
        pokedexRepository.performPokemonRequest(with: text as? String ?? "", {
            [weak self] response in
            self?.pokemon = response
            self?.view?.setPokemon(pokemon: self?.pokemon ?? Pokemon())
        })
    }
    
    func getpokemonType(type: String) {
        pokedexRepository.performPokemonTypeRequest(type: type, {
            [weak self] response in
            self?.pokemonType = response
            self?.view?.setPokemonListType(pokemonType: self?.pokemonType ?? PokemonType())
        })
    }
}
