//
//  CharacterListCoordinator.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation
import UIKit

class CharacterListCoordinator: Coordinator {
    let rootViewController: UINavigationController
    private let apiClient: APIClient
    
    private lazy var viewModel: CharacterListViewModel! = {
        let dataSource = CharacterListDataSource(client: apiClient)
        let repository = CharacterListRepositoryImpl(dataSource: dataSource)
        let useCase = CharacterListUseCase(repository: repository)
        var vm = CharacterListViewModel(useCase: useCase)
        vm.coordinatorDelegate = self
        return vm
    }()
    
    init(rootViewController: UINavigationController, apiClient: APIClient) {
        self.rootViewController = rootViewController
        self.apiClient = apiClient
    }
    
    override func start() {
        let characterListViewController: CharacterListViewController = CharacterListViewController()
        characterListViewController.viewModel = viewModel
        rootViewController.pushViewController(characterListViewController, animated: true)
    }
}

extension CharacterListCoordinator: CharacterListViewModelCoordinatorDelegate {
    func loadCharacterDetailsScreen(characterId: Int, characterName: String) {
        let characterDetailsCoordinator = CharacterDetailsCoordinator(rootViewController: rootViewController, apiClient: apiClient, characterId: characterId, characterName: characterName)
        addChildCoordinator(characterDetailsCoordinator)
        characterDetailsCoordinator.start()
    }
}
