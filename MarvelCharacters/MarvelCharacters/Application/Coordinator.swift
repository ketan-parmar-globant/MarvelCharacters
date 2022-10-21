//
//  Coordinator.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation

class Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
}
