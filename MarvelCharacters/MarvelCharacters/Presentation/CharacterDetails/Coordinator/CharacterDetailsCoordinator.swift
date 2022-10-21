//
//  CharacterDetailsCoordinator.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation
import UIKit

class CharacterDetailsCoordinator: Coordinator {
    private let rootViewController: UINavigationController
    private let apiClient: APIClient
    private let characterId: Int
    private let characterName: String
    
    private lazy var viewModel: CharacterDetailsViewModel! = {
        let dataSource = CharacterDetailsDataSource(client: apiClient)
        let repository = CharacterDetailsRepositoryImpl(dataSource: dataSource)
        let useCase = CharacterDetailsUseCase(repository: repository)
        var vm = CharacterDetailsViewModel(useCase: useCase, characterId: characterId, characterName: characterName)
        vm.coordinatorDelegate = self
        return vm
    }()
    
    init(rootViewController: UINavigationController, apiClient: APIClient, characterId: Int, characterName: String) {
        self.rootViewController = rootViewController
        self.apiClient = apiClient
        self.characterId = characterId
        self.characterName = characterName
    }
    
    override func start() {
        let characterDetailsViewController: CharacterDetailsViewController = CharacterDetailsViewController()
        characterDetailsViewController.viewModel = viewModel
        rootViewController.pushViewController(characterDetailsViewController, animated: true)
    }
}

extension CharacterDetailsCoordinator: CharacterDetailsViewModelCoordinatorDelegate {
}

