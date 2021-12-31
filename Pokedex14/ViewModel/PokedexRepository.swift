//
//  PokedexRepository.swift
//  Pokedex14
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import Foundation

class PokedexRepository {
    
    enum Paths: String {
        case pokedexURL = "https://pokeapi.co/api/v2/"
        case pokemon = "pokemon/"
        case type = "type/"
    }
    
    func performListRequest(_ completionHandler: @escaping (PokemonList) -> Void) {
        if let requestURL = URL(string: "\(Paths.pokedexURL.rawValue)\(Paths.pokemon.rawValue)") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.Pokedex.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching pokemon: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(PokemonList.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error decoding Pokemon: \(error)")
                    return
                }
            }.resume()
        }
    }
    
    func performPokemonRequest(with text: String, _ completionHandler: @escaping (Pokemon) -> Void) {
        if let requestURL = URL(string: "\(Paths.pokedexURL.rawValue)\(Paths.pokemon.rawValue)\(text)") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.Pokedex.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching pokemon: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(Pokemon.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error decoding Pokemon: \(error)")
                    return
                }
            }.resume()
        }
    }
    
    func performPokemonTypeRequest(type: String, _ completionHandler: @escaping (PokemonType) -> Void) {
        if let requestURL = URL(string: "\(Paths.pokedexURL.rawValue)\(Paths.pokemon.rawValue)\(type)") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.Pokedex.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching pokemon: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(PokemonType.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error decoding Pokemon: \(error)")
                    return
                }
            }.resume()
        }
    }
}
