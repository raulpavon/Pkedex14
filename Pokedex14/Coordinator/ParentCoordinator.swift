//
//  ParentCoordinator.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 28/11/21.
//

import Foundation

protocol ParentCoordinator: Coordinator {
    func childDidFinish(_ child: Coordinator?)
}

extension ParentCoordinator {
    func childDidFinish(_ child: Coordinator?) {
        if let childCoordinator = child {
            childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
        }
    }
}
