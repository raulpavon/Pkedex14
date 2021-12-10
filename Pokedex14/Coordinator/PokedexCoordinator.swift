//
//  PokedexCoordinator.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import Foundation
import UIKit

class PokedexCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private let factory =  PokedexFactoryImp()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    func start() {
        let pokedexViewController = factory.makePokedexViewController(pokedexCoordinator: self)
        navigationController.setViewControllers([pokedexViewController], animated: false)
    }
    
    func openPokedexDetail(pokemon: Pokemon) {
        let pokedexDetailViewController = factory.makePokedexDetailViewController(pokedexCoordinator: self, pokemon: pokemon)
        navigationController.pushViewController(pokedexDetailViewController, animated: true)
    }
}
