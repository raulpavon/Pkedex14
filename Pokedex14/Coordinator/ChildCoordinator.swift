//
//  ChildCoordinator.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 28/11/21.
//

import Foundation

protocol ChildCoordinator: Coordinator {
    func finish(completion: (() -> Void)?)
}
