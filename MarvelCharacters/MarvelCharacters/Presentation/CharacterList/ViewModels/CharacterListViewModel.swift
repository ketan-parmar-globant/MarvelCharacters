//
//  CharacterListViewModel.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation

class CharacterListViewModel {
    weak var coordinatorDelegate: CharacterListViewModelCoordinatorDelegate?
    weak var viewDelegate: CharacterListViewModelViewDelegate?
    
    private let useCase: CharacterListUseCase
    var characterList: [ResultModel]? = []
    
    init(useCase: CharacterListUseCase) {
        self.useCase = useCase
    }
}

extension CharacterListViewModel: CharacterListViewModelType {
    
    func start() {
        getCharacterList()
    }
    
    @MainActor
    func getCharacterList() {
        Task {
            viewDelegate?.setIndicatorTo(show: true)
            do {
                let characters = try await useCase.run(parameters: ())
                self.characterList = characters?.results
            } catch let error {
                print("catch: \(error.localizedDescription)")
            }
            viewDelegate?.setIndicatorTo(show: false)
            viewDelegate?.reloadData()
        }
    }
    
    func loadCharacterDetailsScreen(index: Int) {
        if let character = characterList?[index], let characterId = character.id, let characterName = character.name {
            coordinatorDelegate?.loadCharacterDetailsScreen(characterId: characterId, characterName: characterName)
        }
    }
}
