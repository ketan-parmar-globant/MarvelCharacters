//
//  AppCoordinator.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow?
    var characterListCoordinator: CharacterListCoordinator!
    
    lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()
    
    let apiClient: APIClient = {
        let client = APIClient()
        return client
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        characterListCoordinator = CharacterListCoordinator(rootViewController: rootViewController, apiClient: apiClient)
        addChildCoordinator(characterListCoordinator)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        characterListCoordinator.start()
    }
}
