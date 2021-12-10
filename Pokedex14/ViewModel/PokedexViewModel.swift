//
//  PokedexViewModel.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import Foundation

protocol PokedexViewModelDelegate: AnyObject {
    func getPokemonList(pokemonList: PokemonList)
    func getPokemonDetail(pokemon: Pokemon)
    func getPokemonType(pokemon: PokemonType)
}

class PokedexViewModel {
    
    weak var delegate: PokedexViewModelDelegate?
    
    func getPokemonList() {
        performListRequest(with: "\(GlobalConstants.Pokedex.pokedexURL)pokemon")
    }
    
    func getPokemonDetail<T>(_ text: T) {
        let urlString = "\(GlobalConstants.Pokedex.pokedexURL)pokemon/\(text)"
        performPokemonRequest(with: urlString)
    }
    
    func getpokemonType(type: String) {
        let urlString = "\(GlobalConstants.Pokedex.pokedexURL)type/\(type)"
        performPokemonTypeRequest(with: urlString)
    }
    
    func performListRequest(with urlString: String) {
        if let requestURL = URL(string: urlString) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.Pokedex.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching pokemon: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
                    self.delegate?.getPokemonList(pokemonList: pokemonList)
                } catch {
                    print("Error decoding Pokemon: \(error)")
                    return
                }
            }.resume()
        }
    }
    
    func performPokemonRequest(with urlString: String) {
        if let requestURL = URL(string: urlString) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.Pokedex.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching pokemon: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    self.delegate?.getPokemonDetail(pokemon: pokemon)
                } catch {
                    print("Error decoding Pokemon: \(error)")
                    return
                }
            }.resume()
        }
    }
    
    func performPokemonTypeRequest(with urlString: String) {
        if let requestURL = URL(string: urlString) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.Pokedex.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching pokemon: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let pokemon = try JSONDecoder().decode(PokemonType.self, from: data)
                    self.delegate?.getPokemonType(pokemon: pokemon)
                } catch {
                    print("Error decoding Pokemon: \(error)")
                    return
                }
            }.resume()
        }
    }
}
